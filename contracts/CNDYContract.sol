// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/// @title Crypto Candy Crush NFT Contract
/// @author BigDog
/// @dev This contract leverages OpenZeppelin's ERC721URIStorage to handle the minting and management of unique NFTs for the game Crypto Candy Crush.
/// @notice This contract is under development and managed by an amateur developer.

import {ERC721URIStorage, ERC721} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "./CrushToken.sol";

contract CNDYContract is ERC721URIStorage, ReentrancyGuard {
    /// @dev Counter to track the number of NFTs minted and to ensure each NFT has a unique ID.
    uint256 private _currentTokenId = 1;
    CrushToken private crushToken // Reference to CRUSH token contract

    /// @notice Initializes the contract by setting the NFT name and ticker.
    // q why set CrushToken addy here?
    constructor(address crushTokenAddress) ERC721("CryptoCandy", "CNDY") {
        crushToken = CrushToken(crushTokenAddress); //Inititalize the CRUSH token contract
    }

    /// @notice Mints a new NFT to the msg.sender with a unique token ID after burning CRUSH tokens.
    /// @dev The _safeMint function checks that the recipient address can receive ERC721 tokens.
    /// @dev The _setTokenURI is called to associate metadata with the newly minted token.
    // q is the math here 'safe'?
    function mintCNDY() public nonReentrant {
        uint256 crushBalance = crushToken.balanceOf(msg.sender); // Get the CRUSH balance of msg.sender
        uint256 crushToBurn = crushBalance / 10; // Calculate 10% of the CRUSH holdings

        crushToken.burnForCNDY(crushToBurn); // Call the burn function in CRUSH contract

        _safeMint(msg.sender, _currentTokenId);
        _setTokenURI(_currentTokenId, generateTokenURI(_currentTokenId));
        _currentTokenId++;
    }

        function generateTokenURI(uint256 tokenId) private view returns (string memory) {
            // This function should return a valid URI pointing to the metadata of the NFT
            return string(abi.encodePacked("https://api.mysite.com/metadata/", Strings.toString(tokenId)));
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
