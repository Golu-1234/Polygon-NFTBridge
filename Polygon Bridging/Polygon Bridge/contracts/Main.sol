// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "erc721a/contracts/ERC721A.sol";

contract Main is ERC721A{

    address public owner;

    
    uint256 public maxQuantity = 5;

    // Base url for the nfts
    string baseUrl = "https://orange-hidden-worm-487.mypinata.cloud/ipfs/QmVnSzF4vYetUEx6iERvc7LmH5KTDJdqbuz6dorhXL5mJh/";

    
    string public prompt =
        "GIGANTIC";

    constructor() ERC721A("NFT", "NF") {
        owner = msg.sender;
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform!");
        _;
    }

    
    function mint(uint256 quantity) external payable onlyOwner{
        require(totalSupply() + quantity <= maxQuantity ,"not mint more than 5");
        _mint(msg.sender, quantity);
    }

    
    function _baseURI() internal view override returns (string memory){
        return baseUrl;
    }

    // Return the URL for the prompt description
    function promptDescription() external view returns (string memory) {
        return prompt;
    }
}
