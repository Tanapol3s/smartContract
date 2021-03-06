// SPDX-License-Identifier: Unlicense

pragma solidity ^0.8.0;

contract Will {
    address _admin;
    mapping(address => address) _heirs;
    mapping(address => uint) _balances;
    
    event  Create(address indexed owner, address indexed heir, uint amount);
    event Decrased(address indexed owner, address indexed heir, uint amount);
    
    constructor() {
        _admin = msg.sender;
    }
    
    function create(address heir) public payable {
        require(msg.value > 0, "amount is zero");
        _heirs[msg.sender ] = heir;
        _balances[msg.sender] = msg.value;
        emit Create(msg.sender, heir, msg.value);
    }
    
    function decrased(address owner) public {
        require(msg.sender == _admin, "not admin");
        require(_balances[owner] > 0, "no testament");
        
        emit Decrased(owner, _heirs[owner], _balances[owner]);
        payable(_heirs[owner]).transfer(_balances[owner]);
        _heirs[owner] = address(0);
        _balances[owner] = 0;
    }
//123
}