// contracts/MyNFT.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
//import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";
//import {ERC2981} from "@openzeppelin/contracts/token/common/ERC2981.sol";


contract Plume20 is ERC20 {
    uint8 customDecimals;
    constructor(string memory name, string memory symbol, uint8 _customDecimals) ERC20(name, symbol) {
        //add more things here
        customDecimals=_customDecimals;
    }
    function mint(address to, uint256 value) public {
        _mint(to,value);
    }

    function decimals() override public view returns(uint8) {
        return customDecimals;
    }

}