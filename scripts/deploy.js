
const { ethers } = require("hardhat");

async function main() {
  const GigIdentity = await ethers.getContractFactory("GigIdentity");
  const gigIdentity = await GigIdentity.deploy();
  await gigIdentity.deployed();
  console.log("GigIdentity deployed to:", gigIdentity.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });