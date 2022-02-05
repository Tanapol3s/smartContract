pragma solidity ^0.5.13;

contract SendEthExample {
    
    function receiveMoney() public payable {
        
    }
    
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
    
    function withdraw() public {
        address payable to = msg.sender;
        to.transfer(address(this).balance);
    }
    
    function withdrawTo(address payable _to) public {
        _to.transfer(address(this).balance);
    }
}