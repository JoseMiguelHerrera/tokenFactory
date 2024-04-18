// contracts/MyNFT.sol
// SPDX-License-Identifier: MIT

//import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
//import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import {Plume721} from './Plume721.sol';
import {Plume20} from './Plume20.sol';


pragma solidity ^0.8.20;

contract PlumeFactory {
    //constructor(){}
    uint256 public totalContractsCreated ; //contract id
    uint256 public totalErc20;
    uint256 public total721;

    enum TypeOfMint {
        erc20,
        erc721
    }
    //errors
    error InvalidMint(TypeOfMint requested);

    //events
    event CreatedContract(
        address indexed creator,
        address newContract,
        TypeOfMint typeOfMint,
        uint256 id
    );

    // address of created contract => address of creator
    mapping(address => address) public creators;

    mapping(uint256 => address) public contractsByIds;

    //be callable by anyone that wants to create a token
    function createNewContract(
        TypeOfMint typeOfMint,
        string memory name,
        string memory symbol,
        uint8 decimals //how can we make sure that this is optional. Function overloading.
    ) public returns (address) {//TODO: add re-entrancy guard
        address newAddress;
        if (typeOfMint == TypeOfMint.erc20) {
            Plume20 newErc20 = new Plume20(name, symbol,decimals);//-> constructor
            totalErc20++;
            newAddress = address(newErc20);
        } else if (typeOfMint == TypeOfMint.erc721) {
            Plume721 newErc721 = new Plume721(name, symbol);//-> constructor
            total721++;
            newAddress = address(newErc721);
        } else {
            revert InvalidMint(typeOfMint);
        }

        creators[newAddress]=msg.sender;
        contractsByIds[totalContractsCreated] = newAddress;
        emit CreatedContract(
            msg.sender,
            newAddress,
            typeOfMint,
            totalContractsCreated
        );
        totalContractsCreated++;
        return newAddress;
    }
}
