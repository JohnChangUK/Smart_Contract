var SelfDestruct = artifacts.require("./SelfDestruct.sol");

module.exports = function(callback) {

    var selfDestruct;

    return SelfDestruct.deployed().then(function(instance) {
        selfDestruct = instance;

        selfDestruct.setValue("Value set");

        return selfDestruct.notSetYet.call();
    }).then(function(result) {
        console.log("Value is now: ", result);

        return selfDestruct.deleteContract();
    }).then(function(result) {
        console.log("Contract DELETED!");

        selfDestruct.setValue("NEW VALUEEE");
    });
}