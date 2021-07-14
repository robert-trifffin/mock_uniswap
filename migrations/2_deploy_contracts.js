const TK0 = artifacts.require("TK0");
const TK1 = artifacts.require("TK1");
const Exchange = artifacts.require("Exchange");

module.exports = function (deployer) {
  deployer.deploy(TK0);
  deployer.deploy(TK1);
  deployer.deploy(Exchange);
};
