// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract CNDYContract is ERC721, Ownable {
    uint256 private _currentTokenId = 0;

    // No arguments are needed in this constructor
    constructor(address initialOwner) ERC721("CryptoCandy", "CNDY") Ownable(initialOwner){}

    function mintTo(address recipient) public onlyOwner {
        _safeMint(recipient, _currentTokenId);
        _currentTokenId++;
    }
}
