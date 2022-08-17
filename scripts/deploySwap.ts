import { ethers } from "hardhat";

async function main() {
  const SwapFactory = await ethers.getContractFactory("Swap");
  const swapFactory = await SwapFactory.deploy();

  await swapFactory.deployed();

  console.log(
    "swap contract deployed to this address",
    swapFactory.address
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
