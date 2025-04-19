// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GameNFT is ERC721 , Ownable {
    uint256 private  _tokenIdCounter;

    struct Item  {
        string name;
        string itemType;
        uint256 value;
    }

    mapping (uint256 => Item) public items;

    constructor(address initialOwner) ERC721("Bun" ,"B") Ownable(initialOwner) {
      _tokenIdCounter = 0;
    }

    function mintItem(address player , string memory name ,string memory itemType , uint256 value) public onlyOwner returns (uint256) {
        uint256 tokenId = _tokenIdCounter;
        _safeMint(player , tokenId);
        items[tokenId] = Item(name , itemType , value);
        _tokenIdCounter++;
        return tokenId;
    }

    function getItem(uint256 tokenId) public view returns (Item memory ) {
        return items[tokenId];
    }
}