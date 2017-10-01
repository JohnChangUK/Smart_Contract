pragma solidity ^0.4.4;

// Creating a registry for contracts
contract NameRegistry {

    // Managing information regarding contract instance
    struct ContractInfo {
        address owner;
        address contractInstance;
    // The first version added to the registry must be >= 1
    // Otherwise, the name will NOT BE added
        uint16 version;
    }

    // Manages the name to address mapping
    mapping(bytes32 => ContractInfo) nameInfo;

    // Adds the version of the contract to be used by apps
    function registerName(bytes32 name, address conAddress, uint16 version) returns (bool) {

        // Version MUST start with Number 1
        if (version < 1) 
        revert();

        if (nameInfo[name].contractInstance == 0) {
            nameInfo[name].owner = msg.sender;
            nameInfo[name].contractInstance = conAddress;
            nameInfo[name].version = version;
        } else {
            if (nameInfo[name].owner != msg.sender)
            return false;
            nameInfo[name].contractInstance = conAddress;
            nameInfo[name].version = version;
        }
        return true;
    }

    // Contracts having a dependency on this contract will invoke this function
    function getContractInfo(bytes32 name) constant returns (address, uint16) {
        return (nameInfo[name].contractInstance, nameInfo[name].version);
    }

    function removeContract(bytes32 name) returns (bool) {
        if (msg.sender == nameInfo[name].owner) {
            return true;
        }
        return false;
    }
}