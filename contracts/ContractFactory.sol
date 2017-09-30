pragma solidity ^0.4.4;

contract ChildContract {

    uint public identity;
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

    function transferOwnership(address newOwner, bytes name) OwnerOnly {
        bytes32 former = name;
        owner = newOwner;
        name = name;
        ChildOwnerTransferred(identity, former, name);
    }

    // Check if the Caller is the Owner
    function isOwner(address addr) returns bool {
        return (addr == owner);
    }
}

contract ContractFactory {
    ChildContract[] children;
}