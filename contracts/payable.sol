pragma solidity ^0.4.0;

contract TestTransfer {
    
    function TestTransfer() payable {
        
    }
    
    function receiveFund() payable {
        
    }
    
    function getBalance(address _addr) returns (uint) {
        return _addr.balance;
    }

    function transferFund(address _addr1, uint amount) payable {
        _addr1.transfer(amount);
    }

    function sendFund(address _addr1, uint amount) payable returns (bool) {
        return _addr1.send(amount);
    }
    
}