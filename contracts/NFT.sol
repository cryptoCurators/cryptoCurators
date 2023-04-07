//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract NFT is ERC721URIStorage{


    //uint256 value acts as a token number
    uint256 value;
    address contractAddress;


    // ERC721 constructor initialise the contract by setting a name and symbol to token collection
    constructor(address marketplaceAddress) ERC721("CryptoCurators", "ISM"){
       contractAddress = marketplaceAddress;
    }
    
    // increment function increments the token number.
    function increment() private{
        value++;
        // return value;
    }

    // functions used in createToken are from erc721
    function createToken(string memory _tokenURI) public returns(uint) {

        increment();
        uint256 newItemId = value;

        _mint(msg.sender, newItemId);

        // as far as i understood tokenuri is a function that takes a tokenid and maps it with a string(probably the description of the token) --Anurag Singh💕
        _setTokenURI(newItemId, _tokenURI);

        // owner maps the tokenid of nft to new owner of nft
        // setApprovalforall is taken from erc721 it is a mapping with the following syntax
        // mapping{address => mapping(address => bool)}
        setApprovalForAll(contractAddress, true);

        return newItemId;
    }
}