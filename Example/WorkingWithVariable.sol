pragma solidity ^0.8.4;

contract WorkingWithVariable {
    uint256 public myUInt;
    
    function setMyUInt(uint _myUInt) public {
        myUInt = _myUInt;
    } 
    
    bool public myBool;
    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }
    
    // unit 8 length -256 to 256
    uint8 public myUInt8;
    function incrementUnit8() public {
        myUInt8++;
    }
    function decrementUnit8() public {
        myUInt8--;
    }
    
    address public myAddress;
    function setMyAddress(address _myAddress) public {
        myAddress = _myAddress;
    }
    
    function getBalanceOfAddress() public view returns(uint) {
        return myAddress.balance;
    }
    
    string public myString = 'Hello world!';
    function setMyString(string memory _myString) public {
        myString = _myString;
    }
}