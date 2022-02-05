// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

struct Match {
    bool isOpen;
    bool isMatchFinish;
    bool isMatchPostponse;
    string teamAName;
    string teamBName;
    uint8 teamAScore;
    uint8 teamBScore;
    uint totalTeamAGambling;
    uint totalTeamBGambling;
    mapping(address => uint) teamAGambling;
    mapping(address => uint) teamBGambling;
}

contract BigMatch {
    address private owner;
    mapping(uint => Match) private matches;
    uint private nextMatch;
    IERC20 myCoin;
    uint ethFee;

    event MatchCreated(string indexed _teamAName, string indexed _teamBName, uint indexed _matchNum);
    event CloseMatch(uint indexed _matchNum);
    event FinishMatch(uint indexed _matchNum);
    event Gambling(uint indexed _matchNum, string indexed _teamName);
    event Postpone(uint indexed _matchNum);
    event Claim(uint indexed _matchNum, address indexed _claimer, string indexed _teamName, uint _amount, string matchStatus);

    constructor(IERC20 _myCoin) {
        owner = msg.sender;
        myCoin = _myCoin;
    }
    
    modifier ownerOnly {
        require(msg.sender == owner, "Only owner");
        _;
    }
    
    modifier canFinish(uint _matchNum) {
        bytes memory _teamAByte = bytes(matches[_matchNum].teamAName);
        require(_teamAByte.length > 0, "This match not create yet.");
        require(!matches[_matchNum].isOpen, "This match not closed yet");
        require(!matches[_matchNum].isMatchFinish, "This match is finished.");
        _;
    }
    
    modifier forOpenMatch(uint _matchNum) {
        require(matches[_matchNum].isOpen, "This match is not open.");
        _;
    }
    
    modifier canClaim(uint _matchNum) {
        require(matches[_matchNum].isMatchFinish, "This match is not finished.");
        require(matches[_matchNum].teamAGambling[msg.sender] > 0 || matches[_matchNum].teamBGambling[msg.sender] > 0, "You are not participant.");
        _;
    }
    
    modifier checkAmount() {
        require(msg.value > 0, "Amount must grater than zero.");
        _;
    }

    modifier checkMatchCreated(uint _matchNum) {
        bytes memory _teamAByte = bytes(matches[_matchNum].teamAName);
        require(_teamAByte.length > 0, "This match not create yet.");
        _;
    }
    
    function createMatch(string memory _teamAName, string memory _teamBName) public ownerOnly {
        bytes memory _teamAByte = bytes(_teamAName);
        bytes memory _teamBByte = bytes(_teamBName);
        
        require(_teamAByte.length > 0, "Team A name should not be empty.");
        require(_teamBByte.length > 0, "Team B name should not be empty.");
        matches[nextMatch].teamAName = _teamAName;
        matches[nextMatch].teamBName = _teamBName;
        matches[nextMatch].isOpen = true;
        emit MatchCreated(_teamBName, _teamBName, nextMatch);
        nextMatch++;
    }
    
    function closeMatch(uint _matchNum) public ownerOnly forOpenMatch(_matchNum) {
        matches[_matchNum].isOpen = false;
        emit CloseMatch(_matchNum);
    }
    
    function finishMatch(uint _matchNum, uint8 _teamAScore, uint8 _teamBScore) public ownerOnly canFinish(_matchNum) {
        matches[_matchNum].teamAScore = _teamAScore;
        matches[_matchNum].teamBScore = _teamBScore;
        matches[_matchNum].isMatchFinish = true;
        emit FinishMatch(_matchNum);
    }

    function postponeMatch(uint _matchNum) public checkMatchCreated(_matchNum) ownerOnly {
        matches[_matchNum].teamAScore = 0;
        matches[_matchNum].teamBScore = 0;
        matches[_matchNum].isMatchFinish = true;
        matches[_matchNum].isMatchPostponse = true;
        emit Postpone(_matchNum);
    }
    
    function gamblingTeamA(uint _matchNum) payable public checkMatchCreated(_matchNum) forOpenMatch(_matchNum) checkAmount {
        matches[_matchNum].totalTeamAGambling += msg.value;
        matches[_matchNum].teamAGambling[msg.sender] += msg.value;
        emit Gambling(_matchNum, matches[_matchNum].teamAName);
        //distribute gov token
        myCoin.transferFrom(owner, msg.sender, msg.value);
    }
    
    function gamblingTeamB(uint _matchNum) payable public checkMatchCreated(_matchNum) forOpenMatch(_matchNum) checkAmount {
        matches[_matchNum].totalTeamBGambling += msg.value;
        matches[_matchNum].teamBGambling[msg.sender] += msg.value;
        emit Gambling(_matchNum, matches[_matchNum].teamBName);
        //distribute gov token
        myCoin.transferFrom(owner, msg.sender, msg.value);
    }
    
    function getOpenMatch() public view returns(string[] memory teamAName, string[] memory teamBName, uint[] memory matchNum) {
        string[] memory _teamAName = new string[](nextMatch);
        string[] memory _teamBName = new string[](nextMatch);
        uint[] memory _matchNum = new uint[](nextMatch);
        uint _current;
        for (uint i=0; i < nextMatch; i++) {
            if(matches[i].isOpen) {
                _teamAName[_current] = matches[i].teamAName;
                _teamBName[_current] = matches[i].teamBName;
                _matchNum[_current] = i;
                _current++;
            }
        }
        
        return (_teamAName, _teamBName, _matchNum);
    }
    
    function getYourBalanceTeamA(uint _matchNum) public view checkMatchCreated(_matchNum) returns(uint) {
        return matches[_matchNum].teamAGambling[msg.sender];
    }
    
    function getYourBalanceTeamB(uint _matchNum) public view checkMatchCreated(_matchNum) returns(uint) {
        return matches[_matchNum].teamBGambling[msg.sender];
    }
    
    function getMatchStatus(uint _matchNum) private view returns (string memory) {
        if (matches[_matchNum].isMatchPostponse) {
            return "Postpone";
        } else {
            return "Finish";
        }
    }

    function claimTeamA(uint _matchNum) public checkMatchCreated(_matchNum) canClaim(_matchNum) {
        require(matches[_matchNum].teamAScore >= matches[_matchNum].teamBScore, string(abi.encodePacked(matches[_matchNum].teamBName, " is winner.")));
        require(matches[_matchNum].teamAGambling[msg.sender] > 0, "Nothing to claim.");

        uint senderAmount = matches[_matchNum].teamAGambling[msg.sender];
        // if team a win else draw
        if (matches[_matchNum].teamAScore > matches[_matchNum].teamBScore) {
            uint percent = (senderAmount * 1000000000000000000) / matches[_matchNum].totalTeamAGambling;
            uint retAmount = ((percent * matches[_matchNum].totalTeamBGambling) / 1000000000000000000) + matches[_matchNum].teamAGambling[msg.sender];

            //collect fee
            uint fee = retAmount / 1000;
            ethFee += fee;

            //pay to sender
            payable(msg.sender).transfer(retAmount - fee);
            matches[_matchNum].teamAGambling[msg.sender] = 0;
            emit Claim(_matchNum, msg.sender, matches[_matchNum].teamAName, retAmount - fee, getMatchStatus(_matchNum));
        } else {
            payable(msg.sender).transfer(senderAmount);
            emit Claim(_matchNum, msg.sender, matches[_matchNum].teamAName, senderAmount, getMatchStatus(_matchNum));
        }
    }

    function claimTeamB(uint _matchNum) public checkMatchCreated(_matchNum) canClaim(_matchNum) {
        require(matches[_matchNum].teamBScore >= matches[_matchNum].teamAScore, string(abi.encodePacked(matches[_matchNum].teamAName, " is winner.")));
        require(matches[_matchNum].teamBGambling[msg.sender] > 0, "Nothing to claim.");

        uint senderAmount = matches[_matchNum].teamBGambling[msg.sender];
        // if team b win else draw
        if (matches[_matchNum].teamBScore > matches[_matchNum].teamAScore) {
            uint percent = (senderAmount * 1000000000000000000) / matches[_matchNum].totalTeamBGambling;
            uint retAmount = ((percent * matches[_matchNum].totalTeamAGambling) / 1000000000000000000) + matches[_matchNum].teamBGambling[msg.sender];
            
            //collect fee
            uint fee = retAmount / 1000;
            ethFee += fee;

            //pay to sender
            payable(msg.sender).transfer(retAmount - fee);
            matches[_matchNum].teamBGambling[msg.sender] = 0;
            emit Claim(_matchNum, msg.sender, matches[_matchNum].teamBName, retAmount - fee, getMatchStatus(_matchNum));
        } else {
            payable(msg.sender).transfer(senderAmount);
            emit Claim(_matchNum, msg.sender, matches[_matchNum].teamBName, senderAmount, getMatchStatus(_matchNum));
        }
    }

    function estimateRewardTeamA(uint _matchNum) checkMatchCreated(_matchNum) public view returns(uint) {
        if(matches[_matchNum].teamAGambling[msg.sender] == 0) {
            return 0;
        } else {
            uint senderAmount = matches[_matchNum].teamAGambling[msg.sender];
            uint percent = (senderAmount * 1000000000000000000) / matches[_matchNum].totalTeamAGambling;
            return (percent * matches[_matchNum].totalTeamBGambling) / 1000000000000000000;
        }
    }

    function estimateRewardTeamB(uint _matchNum) checkMatchCreated(_matchNum) public view returns(uint) {
        if(matches[_matchNum].teamBGambling[msg.sender] == 0) {
            return 0;
        } else {
            uint senderAmount = matches[_matchNum].teamBGambling[msg.sender];
            uint percent = (senderAmount * 1000000000000000000) / matches[_matchNum].totalTeamBGambling;
            return (percent * matches[_matchNum].totalTeamAGambling) / 1000000000000000000;
        }
    }

    function getTotalTeamAGambling(uint _matchNum) checkMatchCreated(_matchNum) public view returns(uint) {
        return matches[_matchNum].totalTeamAGambling;
    }

    function getTotalTeamBGambling(uint _matchNum) checkMatchCreated(_matchNum) public view returns(uint) {
        return matches[_matchNum].totalTeamBGambling;
    }

    function transferFeeToOwner() public ownerOnly {
        payable(msg.sender).transfer(ethFee);
        ethFee = 0;
    }    
}