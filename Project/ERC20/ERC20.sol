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
    function allowance(address owner, address spender) external view returns (uint256 remaining);
    function transferFrom(address from, address to, uint amount) external returns (bool success);
}

abstract contract ERC20 is IERC20 {
    string _name;
    string _symbol;
    uint _totalSupply;
    mapping(address => uint) _balances;
    //owner => (spender => amount)
    mapping(address => mapping(address=>uint)) _allowance;

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

    function allowance(address owner, address spender) public override view returns (uint256 remaining) {
        return _allowance[owner][spender];
    }

    function transferFrom(address from, address to, uint amount) public override returns (bool success) {
        if (from != msg.sender) {
            uint allowanceAmount = _allowance[from][msg.sender];
            require(allowanceAmount >= amount, "transfer amount exceed");
            _approve(from, msg.sender, allowanceAmount - amount);
        }
        _transfer(from, to, amount);
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
        require(owner != address(0), "approve from zero address");
        require(spender != address(0), "approve spender from zero address");

        _allowance[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    function _mint(address to, uint amount) internal {
        require(to != address(0), "mint to zero address");
        _totalSupply += amount;
        _balances[to] += amount;

        emit Transfer(address(0), to, amount);
    }

    function _burn(address from,uint amount) internal {
        require(from != address(0), "burn from zero address");
        require(_balances[from] >= amount, "limit amount exceed");
        _totalSupply -= amount;
        _balances[from] -= amount;

        emit Transfer(from, address(0), amount);
    }
}

contract TDC is ERC20 {
    constructor() ERC20("TongDeeCoin", "TDC") {

    }
}