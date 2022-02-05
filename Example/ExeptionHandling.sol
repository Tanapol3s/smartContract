pragma solidity ^0.5.13;

contract ExeptionHandling {
    mapping (address => uint) public balanceReceived;
    
    function receivingMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }
    
    function withdrawMoney(uint _amount) public {
        assert(balanceReceived[msg.sender] >= _amount);
        balanceReceived[msg.sender] -= _amount;
        msg.sender.transfer(_amount);
    }
}