// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {PlumeFactory} from "../src/PlumeFactory.sol";

import {Plume721} from '../src/Plume721.sol';
import {Plume20} from '../src/Plume20.sol';

contract CounterTest is Test {

    PlumeFactory public factory;

    //string public defaultName="MyNFT";
    //string public defaultSymbol="MNFT";

    function setUp() public {
        factory = new PlumeFactory();
    }


    /*
    2 basic types
    => erc20
        => custom decimals, 18 and 6 
    => erc721
        => deployment was successful (name and symbol)

    invalid mint 721/invalid miunt erc20
    */


    function test_erc20_18decimals() public {
        address newAddress=factory.createNewContract(PlumeFactory.TypeOfMint(0),"test2018", "2018",18);
        assertEq(factory.totalContractsCreated(),1);
        assertEq(factory.totalErc20(),1);
        assertEq(factory.total721(),0);
        assertEq(factory.contractsByIds(0),newAddress);
        assertEq(factory.creators(newAddress), address(this));
        assertEq(Plume20(newAddress).name(), "test2018");
        assertEq(Plume20(newAddress).symbol(),"2018");
        assertEq(Plume20(newAddress).decimals(),18);
        
        Plume20(newAddress).mint(address(this),1000);
        assertEq(Plume20(newAddress).balanceOf(address(this)),1000);
    }

    function test_erc20_invalid() public {
        address newAddress=factory.createNewContract(PlumeFactory.TypeOfMint(4),"test2018", "2018",18);

    }

    /*
    function test_erc20_6decimals() public {

        assertEq(nft.name(),defaultName);
        assertEq(nft.symbol(),defaultSymbol);
    }

    function test_erc721() public {
        assertEq(nft.name(),defaultName);
        assertEq(nft.symbol(),defaultSymbol);
    }

    function test_invalidType() public {
      
    }
    */

}
