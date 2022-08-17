import { ethers } from "hardhat";

async function main() {
  const LinkTokenFactory = await ethers.getContractFactory("LinkToken");
  const linkTokenFactory = await LinkTokenFactory.deploy();

  await linkTokenFactory.deployed();

  console.log(
    "Link Token deployed to this address",
    linkTokenFactory.address
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
