pragma solidity ^0.5.13;

contract FallBackFunctionExample {
    mapping (address => uint) public balanceReceived;
    
    function receivingMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }
    
    function withdrawMoney(uint _amount) public {
        require(_amount >= balanceReceived[msg.sender], "Too many.");
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
        balanceReceived[msg.sender] -= _amount;
        msg.sender.transfer(_amount);
    }
    
    // fallback function
    function () external payable {
        receivingMoney();
    }
    
    //pure function mean dons't interact with storage
    function convertWeiToEther(uint _amountInWei) public pure returns(uint) {
        return _amountInWei / 1 ether;
    }
}