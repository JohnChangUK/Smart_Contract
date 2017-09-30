pragma solidity ^0.4.4;

contract ChildContract {

    uint8 public identity;
    address public owner;
    bytes32 public name;

    modifier OwnerOnly {
        if (msg.sender != owner) {
            revert();
        }
        _;
    }

    event ChildOwnerTransferred(uint8 identity, bytes32 from, bytes32 to);

    function ChildContract(uint identity, address owner, bytes32 name) {
        identity = identity;
        owner = owner;
        name = name;
    }

    function transferOwnership(address newOwner, bytes32 name) OwnerOnly {
        bytes32 former = name;
        owner = newOwner;
        name = name;
        ChildOwnerTransferred(identity, former, name);
    }

    // Check if the Caller is the Owner
    function isOwner(address addr) returns (bool) {
        return (addr == owner);
    }
}

contract ContractFactory {
    ChildContract[] children;

    uint public initialPrice;

    function ContractFactory(uint8 numParts, uint8 price) {
        for(uint8 i = 0; i < numParts; i++) {
            children.push(new ChildContract(i, this, "****"));
        }
        initialPrice = price;
    }

    // Anyone can pay the price and purchase the asset

    function purchase(bytes32 name) payable {
        // msg.value is the value received
        if (msg.value < initialPrice)
        revert();
    // Looks for Available Asset, i.e One that is not sold yet
    for (uint8 i = 0; i < children.length; i++) {
        // Check if the contract factory is the owner
        if (children[i].isOwner(this)) {
            children[i].transferOwnership(msg.sender, name);
            return;
        }
    }
    // No more assets available - so throw an exception
    revert();
}

// Returns the information about the child contract at specified index
function getInfo(uint8 childIndex) constant returns (uint8, address, bytes32) {
    return (children[childIndex].identity(), children[childIndex].owner(), children[childIndex].name());
}

// Returns the child contract address
function getChildContractAddress(uint8 childIndex) returns (address) {
    return address(children[childIndex]);
}

// Returns name of the owner based on the child index
function getOwnerName(uint8 childIndex) constant returns (bytes32) {
    bytes32 ownerName = children[childIndex].name();
    return ownerName;
}

// Returns the count of the children
function getChildrenCount() constant returns (uint) {
    return children.length;
}

}