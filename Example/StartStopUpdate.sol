pragma solidity ^0.5.13;

contract StartStopUpdate {
    address owner;
    bool pause;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function sendMoney() public payable {
        
    }
    
    function setPause(bool _pause) public {
        pause = _pause;
    }
    
    function withdrawMoney(address payable _to) public {
        require(msg.sender == owner, "You are not owner");
        require(!pause, "Is paused");
        _to.transfer(address(this).balance);        
    }
    
    function destroySmartContract(address payable _to) public {
        require(msg.sender == owner, "You are not owner");
        selfdestruct(_to); 
    }
}