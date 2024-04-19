// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/// @title Crypto Candy Crush NFT Contract
/// @author BigDog
/// @dev This contract leverages OpenZeppelin's ERC721URIStorage to handle the minting and management of unique NFTs for the game Crypto Candy Crush.
/// @notice This contract is under development and managed by an amateur developer.

import {ERC721URIStorage, ERC721} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract CNDYContract is ERC721URIStorage, Ownable {
    /// @dev Counter to track the number of NFTs minted and to ensure each NFT has a unique ID.
    uint256 private _currentTokenId = 0;

    /// @notice Initializes the contract by setting the NFT name and ticker, and the initial owner.
    /// @param initialOwner The address of the initial owner who is granted minting rights.
    constructor(address initialOwner) ERC721("CryptoCandy", "CNDY") Ownable(initialOwner){}

    /// @notice Mints a new NFT to the specified address with a unique token ID.
    /// @dev The _safeMint function checks that the recipient address can receive ERC721 tokens.
    /// @dev The _setTokenURI is called to associate metadata with the newly minted token.
    /// @param recipient The address to receive the NFT.
    function mintTo(address recipient) public onlyOwner {
        _safeMint(recipient, _currentTokenId);
        _setTokenURI(_currentTokenId, tokenURI(_currentTokenId));
        _currentTokenId++;
    }

    /// @notice Sets or updates the URI for a specific token ID.
    /// @dev This function can only be called by the owner and should point to a valid metadata file.
    /// @param tokenId The token ID whose URI is being set or updated.
    /// @param _tokenURI The new URI for the token.
    function setTokenURI(uint256 tokenId, string memory _tokenURI) public onlyOwner {
        _setTokenURI(tokenId, _tokenURI);
    }

    /// @dev Returns the base URI used to construct the full URI for each token.
    /// @return The base URI for all tokens.
    function _baseURI() internal pure override returns (string memory) {
        return "https://api.example.com/candy/";
    }
}
