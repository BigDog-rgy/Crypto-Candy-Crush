const { ethers } = require("hardhat");

async function main() {
    const [deployer] = await ethers.getSigners();

    console.log("Deploying contracts with the account:", deployer.address);
    console.log("Account balance: ", (await deployer.getBalance()).toString());

    const CNDYContract = await ethers.getContractFactory("CNDYContract");

    const cndy = await CNDYContract.deploy(deployer.address);
    await cndy.deployer();

    console.log("CNDYContract deployed to:", cndy.address);
}

main().then(() => process.exit(0)).catch(error => {
    console.error(error);
    process.exit(1);
});