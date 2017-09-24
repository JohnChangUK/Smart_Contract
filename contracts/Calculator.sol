pragma solidity ^0.4.0;


contract Calculator {
    uint public addResult;
    
    function doAddition(uint num1, uint num2) returns (uint) {
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


contract ChildCalculator is Calculator {
    function getFinalResult() returns (uint) {
        return addResult;
    }
    
    function calcFinalResult(address calcAddress) returns (uint) {
        Calculator calc = Calculator(calcAddress);
        return calc.addResult();
    }
}