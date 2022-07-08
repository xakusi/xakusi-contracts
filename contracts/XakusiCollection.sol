// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract XakusiCollection is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter public _tokenIds;
    address contractAddress;

    uint256 public collectionSize;

    constructor(uint256 _collectionSize) ERC721("Xakusi Collection", "XKSI") {
        collectionSize = _collectionSize;
    }

    function baseTokenURI() public view returns (string memory) {
        return "https://gateway.pinata.cloud/ipfs/";
    }

    function mintToken(string memory tokenURI) public returns (uint256) {
        _tokenIds.increment();

        require(
            _tokenIds.current() < collectionSize,
            "Sorry all Items have been minted"
        );

        uint256 newItemId = _tokenIds.current();

        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}
