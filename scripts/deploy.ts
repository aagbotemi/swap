import { ethers } from "hardhat";

async function main() {
  let [owner, user1, user2, user3, user4, user5] = await ethers.getSigners();

  const MultisigFactory = await ethers.getContractFactory("");
  const multisigFactory = await MultisigFactory.deploy();

  await multisigFactory.deployed();

  console.log(
    "factory contract deployed to this address",
    multisigFactory.address
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
