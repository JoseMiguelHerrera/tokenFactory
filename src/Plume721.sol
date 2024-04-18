// contracts/MyNFT.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
//import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";
//import {ERC2981} from "@openzeppelin/contracts/token/common/ERC2981.sol";

contract Plume721 is ERC721 {
    constructor(string memory name, string memory symbol) ERC721(name, symbol) {
        //add more things here
    }
    function mint(address to, uint256 tokenId) public {
        _safeMint(to,tokenId);
    }
}