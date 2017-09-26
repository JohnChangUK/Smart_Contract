pragma solidity ^0.4.0;

contract SelfDestruct {
    
    address owner;
    string public notSetYet = "Not Set Yet";
    mapping(address => uint) balances;
    
    modifier OwnerOnly {
        if (msg.sender != owner) {
            revert();
        } else {
            _;
        }
    }
    
    function SelfDestruct() {
        owner = msg.sender;
    }
    
    function setValue(string value) {
        notSetYet = value;
    }
    
    function deleteContract() OwnerOnly {
        selfdestruct(owner);
    }
    
    function getBalance() returns (uint) {
        return balances[msg.sender];
    }
    
    function addBalance(uint amount) returns (uint) {
        balances[msg.sender] += amount;
        return balances[msg.sender];
    }
}