var Calc = artifacts.require("./Calc.sol");

contract('Calc', function(accounts) {

  // Expected behaviour - result initialised to 10
  // Test Case #1
  it("should assert true", function() {
    var calc;
    return Calc.deployed().then(function(instance) {
      calc = instance;
      return calc.getResult.call();
    }).then(function (result) {
      assert.equal(result.valueOf(), 10, "Contract initialised with value NOT equal to 10");
      calc.addToNumber(10);
      calc.subtractFromNumber(5);
      return calc.getResult.call();
    }).then(function (result) {
      assert.equal(result.valueOf(), 15, "Contract initialised with value NOT equal to 10");
  });
  });
});