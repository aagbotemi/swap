import { ethers } from "hardhat";

async function main() {
  const W3BTokenFactory = await ethers.getContractFactory("W3BToken");
  const w3BTokenFactory = await W3BTokenFactory.deploy();

  await w3BTokenFactory.deployed();

  console.log(
    "W3B Token deployed to this address",
    w3BTokenFactory.address
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
