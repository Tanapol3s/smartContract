// SPDX-License-Identifier: Unlicense

pragma solidity ^0.8.0;

contract Bank {
    mapping(address => uint) _balances;
    uint private _totalBalance;
    
    event Deposit(address indexed owner, uint amount);
    event WithDraw(address indexed owner, uint amount);
    
    function deposit() public payable {
        require(msg.value > 0, "Deposit money is zero.");
        _balances[msg.sender] += msg.value;
        _totalBalance += msg.value;
        emit Deposit(msg.sender, msg.value);
    }
    
    function withdraw(uint amount) public {
        require(amount == 0, "Amount must grater than zero.");
        require(_balances[msg.sender] >= amount, "Not enough money");
        payable(msg.sender).transfer(amount);
        _balances[msg.sender] -= amount;
        _totalBalance -= amount;
        emit WithDraw(msg.sender, amount);
    }
    
    function checkBalance() public view returns (uint){
        return _balances[msg.sender];
    }
    
    function getTotalBalance() public view returns (uint) {
        return _totalBalance;
    }
}