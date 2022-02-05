// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


interface IERC20 {
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);
    function totalSupply() external view returns (uint256);
    function balanceOf(address owner) external view returns (uint256 balance);
    function transfer(address to, uint amount) external returns (bool success);
    function approve(address spender, uint amount) external returns (bool success);
    // function transferFrom(address _from, address _to, uint256 _value) external returns (bool success);
    // function allowance(address _owner, address _spender) external view returns (uint256 remaining);
}

abstract contract ERC20 is IERC20 {
    string _name;
    string _symbol;
    uint _totalSupply;
    mapping(address => uint) _balances;

    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    function name() public override view returns (string memory) {
        return _name;
    }

    function symbol() public override view returns (string memory) {
        return _symbol;
    }

    function decimals() public override pure returns (uint8) {
        return 18;
    }

    function totalSupply() public override view returns (uint) {
        return _totalSupply;
    }

    function balanceOf(address owner) public override view returns (uint256 balance) {
        return _balances[owner];
    }

    function transfer(address to, uint amount) public override returns (bool success) {
        _transfer(msg.sender, to, amount);
        return true;
    }

    function approve(address spender, uint amount) public override returns (bool success) {
        _approve(msg.sender, spender, amount);
        return true;
    }

    // private function 
    function _transfer(address from, address to, uint amount) internal {
        require(from != address(0), "transfer from zero address");
        require(to != address(0), "transfer to zero address");
        require(_balances[from] >= amount, "not enough supply");
        _balances[from] -= amount;
        _balances[to] += amount;
        emit Transfer(from, to, amount);
    }

    function _approve(address owner, address spender, uint amount) internal {

    }
}