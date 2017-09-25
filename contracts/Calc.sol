pragma solidity ^0.4.4;

contract Calc {

  uint result;

  function Calc(uint initial) {
    result = initial;
  }

  function getResult() returns (uint) {
    return result;
  }

  function addToNumber(uint num) {
    result = result + num;
  }

  function subtractFromNumber(uint num) {
    result = result - num;
  }

  function multiplyWithNumber(uint num) {

  }

  function divideByNumber(uint num) {

  }

}
