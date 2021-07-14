# mock_uniswap

Ethereum dapp 개발 환경을 구축하기 위해서는 Testnet에서 작업을 하거나, 개인적으로 노드를 설정하여 Private network을 구성하는 방법도 있지만, 
대부분의 개발자들은 ganache라는 ethereum network emulator를 사용합니다.

ganache의 장점은 자동생성된 Account 10개에 100ETH 씩 배분된 상태에서 작업을 진행할수 있다는 점입니다.
Private key도 주어지기 때문에 메타마스크의 localhost rpc 옵션을 사용하여 메타마스크와 연동할 수 있습니다.
언제라도 껏다켜면 0번블록 상태로 돌아오기때문에 깔끔한 네트워크에서 다양한 시나리오를 반복적으로 테스트 할수 있게 됩니다.

truffle은 Smart Contract를 개발하고 컴파일하며, 다양한 네트워크에 배포를 도와주는 도구입니다.
Testnet의 경우 컨트렉트를 잘못짜면, 새로운 주소에 새로운 코드를 배포해야 하지만
ganache에 배포하도록 설정하면  늘 고정적인 컨트렉트 주소를 사용할수 있게 됩니다.
이부분이 참 장점인듯 합니다.

이 샘플을 통해 truffle과 Smart Contract 컴파일 & 배포 연습을 할수 있습니다.

유니스왑 컨트렉트는 x * y = k 라는 수식을 사용하기 위해 만들어본 것으로서
풀을 생성하고, 유동성을 추가하거나 제거하며, 토큰간 교환기능을 수식에 따라 제공하는 것을 목표로 하였습니다.

이렇게 컨트렉트를 만들었어도, 실제 컨트렉트를 호출하기 위해서는 dapp과 지갑이 필요합니다.
uniswap frontend는 metamask를 연결하여 유니스왑 컨트렉트를 호출하는 것을 도와주고,
결과값을 디스플레이 합니다.

### Test scenario
1. 2개의 ERC20 토큰을 배포한다.
2. 유니스왑(Exchange) 컨트렉트를 배포한다
3. metamask를 localhost로 설정하고 ganache에서 제공한 privatekey를 사용하여 토큰이 제대로 보이는지 확인한다.
4. 유니스왑 dapp을 실행하여 pair를 만든다
5. dapp에 유동성을 제공하기 위해 approve를 각 토큰마다 호출하고, liquidity를 제공한다.
6. Liquidity를 제거하거나 토큰간 교환을 시도해본다
