var Calc = artifacts.require("./Calc.sol");
var SelfDestruct = artifacts.require("./SelfDestruct.sol");

module.exports = function(deployer) {
  deployer.deploy(Calc, 10);
  deployer.deploy(SelfDestruct);
};
