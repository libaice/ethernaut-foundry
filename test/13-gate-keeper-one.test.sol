pragma solidity ^0.8;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "src/13-gatekeeper-one/GateKeeperOne.sol";

contract TestGateKeeperOne is Test {
    IGateKeeperOne private target;
    Hack private hack;

    function setUp() public {
        target = IGateKeeperOne(0xbDe412a3a419560a1AFF638031685F35e87b0e30);
        hack = new Hack();
    }

    function test() public {
        for(uint256 i = 100; i< 8191; i++){
            try hack.enter(address(target), i){
                console.log("gas ", i);
                // return;
            }catch{}
            revert("all failed");
        }
    }
}