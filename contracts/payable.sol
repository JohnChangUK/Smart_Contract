pragma solidity ^0.4.0;

contract TestTransfer {
    
    function TestTransfer() payable {
        
    }
    
    function receiveFund() payable {
        
    }
    
    function getBalance(address _addr) returns (uint) {
        return _addr.balance;
    }
    
}