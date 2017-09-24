pragma solidity ^0.4.0;


contract Calculator {
    uint public addResult;
    address owner;
    string word = "Hello World";
    mapping (address => uint) balances;
    
    function Calculator() {
        owner = msg.sender;
    }
    
    function getWord() constant returns (string) {
        return word;
    }
    
    function getBalance(address _addr) returns (uint) {
        return balances[_addr];
    }
    
    function increaseBalance(address _addr) returns (uint) {
        balances[_addr] += 200;
        return balances[_addr];

    }

    function setWord(string newWord) returns (string) {
        if (owner != msg.sender) {
            return "You are not the owner, access DENIED";
        }
        word = newWord;
        return "You are the owner of the contract!";
    }
    
    function doAddition(uint num1, uint num2) public returns (uint) {
        addResult = num1 + num2;
        return addResult;
    }
    
    function calldoAddition() returns (uint) {
        return doAddition(4,6);
    }
    
    function getResult() constant returns (uint) {
        return addResult;
    } 
}


contract Interface {
    uint public interResult;
    
    function addNumber(uint num3, uint num4, address calcAddress) returns (uint) {
        Calculator calc = Calculator(calcAddress);
        return calc.doAddition(num3, num4);
    }
}


contract SuperCalculator is Calculator {
    function getFinalResult() returns (uint) {
        return addResult;
    }
    
    function calcFinalResult(address calcAddress) returns (uint) {
        Calculator calc = Calculator(calcAddress);
        return calc.addResult();
    }
}