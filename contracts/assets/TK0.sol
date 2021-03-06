// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.8.0;

import {
    ERC20,
    ERC20Burnable
} from '@openzeppelin/contracts/token/ERC20/ERC20Burnable.sol';

import {Operator} from '../access/Operator.sol';

contract TK0 is ERC20Burnable, Operator {
    /**
     * @notice Constructs the Basis Bond ERC-20 contract.
     */
    constructor() ERC20('TK0', 'TK0') {
        // Mints 1 Basis Cash to contract creator for initial Uniswap oracle deployment.
        // Will be burned after oracle deployment
        //_mint(_msgSender(), 100 * 10**18);
        _mint(address(0x90F8bf6A479f320ead074411a4B0e7944Ea8c9C1), 100 * 10**18);
        _mint(address(0xFFcf8FDEE72ac11b5c542428B35EEF5769C409f0), 100 * 10**18);
    }

    /**
     * @notice Operator mints basis bonds to a recipient
     * @param recipient_ The address of recipient
     * @param amount_ The amount of basis bonds to mint to
     * @return whether the process has been done
     */
    function mint(address recipient_, uint256 amount_)
        public
        onlyOperator
        returns (bool)
    {
        uint256 balanceBefore = balanceOf(recipient_);
        _mint(recipient_, amount_);
        uint256 balanceAfter = balanceOf(recipient_);

        return balanceAfter > balanceBefore;
    }

    function burn(uint256 amount) public override onlyOperator {
        super.burn(amount);
    }

    function burnFrom(address account, uint256 amount)
        public
        override
        onlyOperator
    {
        super.burnFrom(account, amount);
    }
}
