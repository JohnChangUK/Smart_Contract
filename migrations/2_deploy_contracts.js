var Calc = artifacts.require("./Calc.sol");

module.exports = function(deployer) {
  deployer.deploy(Calc, 10);
};
