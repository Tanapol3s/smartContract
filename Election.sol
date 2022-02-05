// SPDX-License-Identifier: Unlicense

pragma solidity ^0.8.0;

struct Issue {
    bool isOpen;
    mapping(address => bool) isVoted;
    mapping(address => uint) ballots;
    uint[] scores;
}

contract Election {
    address _admin;
    mapping(uint => Issue) _issues;
    uint _issueId;
    
    event StatusChange(uint indexed issueId, bool open);
    event Vote(uint indexed issueId, address indexed  voter, uint indexed option);

    constructor() {
        _admin = msg.sender;
    }
    
    modifier onlyAdmin {
        require(msg.sender == _admin, "Only Admin");
        _;
    }
    
    function open() public onlyAdmin {
        require(!_issues[_issueId].isOpen, "Election opening");
        _issueId++; 
        _issues[_issueId].isOpen = true;
        _issues[_issueId].scores = new uint[](5);
        emit StatusChange(_issueId, true);
    }
    
    function close() public onlyAdmin {
        require(_issues[_issueId].isOpen, "Election not open");
        _issues[_issueId].isOpen = false; 
        emit StatusChange(_issueId , false);
    }
    
    function vote(uint option) public {
        require(_issues[_issueId].isOpen, "Election not open");
        require(_issues[_issueId].isVoted[msg.sender] == false , "You are voted");
        require(option > 0, "option is out of range");
        
        _issues[_issueId].scores[option]++;
        _issues[_issueId].isVoted[msg.sender] = true;
        _issues[_issueId].ballots[msg.sender] = option;
        
        emit Vote(_issueId, msg.sender, option);
    }
    
    function getStatus() public view returns(bool) {
        return _issues[_issueId].isOpen;
    }
    
    function getBallots() public view returns(uint option) {
        return _issues[_issueId].ballots[msg.sender];
    }
    
    function getScore() public view returns(uint[] memory score) {
        return _issues[_issueId].scores;
    }
}