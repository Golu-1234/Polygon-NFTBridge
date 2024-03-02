const { ethers } = require("hardhat");
require("dotenv").config();

async function main() {
  const privateKey = process.env.PRIVATE_KEY;
  const networkAddress = "https://ethereum-goerli.publicnode.com";
  const provider = new ethers.providers.JsonRpcProvider(networkAddress);
  const signer = new ethers.Wallet(privateKey, provider);
  const contractAddress = "0xf2fc80FDe42809221d605913bdc9C6A86470b855";
  const IndianNFT = await ethers.getContractFactory("BLACKHOLE", signer);
  const contract = await IndianNFT.attach(contractAddress);
  await contract.mint(5);

  console.log("Minted 5 tokens");
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
