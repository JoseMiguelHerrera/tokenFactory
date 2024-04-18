// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {Plume721} from "../src/Plume721.sol";

contract CounterTest is Test {
    Plume721 public nft;

    string public defaultName="MyNFT";
    string public defaultSymbol="MNFT";

    function setUp() public {
        nft = new Plume721(defaultName,defaultSymbol);
    }

    function test_deplpy() public {
        assertEq(nft.name(),defaultName);
        assertEq(nft.symbol(),defaultSymbol);
    }


}
