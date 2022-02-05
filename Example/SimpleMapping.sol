pragma solidity ^0.5.13;

contract SimpleMapping {
    mapping(uint => bool) public myMapping;
    mapping(address => uint) public mapp2;
    
    function setValue(uint _index) public {
        myMapping[_index] = true;
    }
    
    function setMap2() payable public {
        require(msg.value > 10000000, "Too little");
        uint betValue = msg.value * 999/1000;
        if (mapp2[msg.sender] > 0) {
            mapp2[msg.sender] = mapp2[msg.sender] + betValue;    
        } else {
            mapp2[msg.sender] = betValue;    
        }
    }
}