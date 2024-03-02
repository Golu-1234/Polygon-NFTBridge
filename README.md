# Minting And Transfering NFT
This Solidity program is used for transferring and minting the NFT's program that demonstrates how to transfer assests from one network to another.Writing scripts to batch transfer all NFTs from Ethereum to Polygon Mumbai

Approve the NFTs to be transferred.

Deposit the NFTs to the Bridge.

## Description
In this Project we are using Polygon Bridge for mapping purpose., this project seeks to establish an NFT collection on the Ethereum blockchain, and transfer assets. we are using Mircosoft Bing AI for NFT creation.

## Contract Information

- Contract Name: Main
- Contract Type: ERC721A (Extends ERC721 standard)
- Solidity Version: 0.8.9
- License: MIT
  
## Steps
Generating the NFT on Midjourney or DALLE.

Download the NFTs and Store in a Folder.

Sign in and upload and store NFTs on PintaCloud(IPFS).

Deploying the Smart Contract on testnet(Goerli).

Implementing prompt description.

Mapping the NFT Collection to Polygon.

Minting of NFTs.

Batch Transferring NFTs to Polygon Mumbai.

## Getting Started
Executing program
To run this program, you can use Gitpod which is always ready to use without installing dependencies, online Solidity IDE.

Once you are on the Gitpod, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., HelloWorld.sol). Copy and paste the following code into the file:

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

Hardhat Config Javascript Code
```javascript
  require("@nomiclabs/hardhat-waffle");
  require("dotenv").config();

 /** @type import('hardhat/config').HardhatUserConfig */
 module.exports = {
  solidity: "0.8.18",
  networks: {
    mumbai: {
      url: 'https://rpc.ankr.com/polygon_mumbai',
      accounts: [process.env.PRIVATE_KEY],
    },
    goerli: {
      url: 'https://ethereum-goerli.publicnode.com',
      accounts: [process.env.PRIVATE_KEY],
    },
  }
};
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.18" (or another compatible version), and then click on the "Compile HelloWorld.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar.

Once the contract is deployed, you can interact with it using terminal

## Authors
Govind Pandey

## License
This project is licensed under the MIT License.
