const { ethers } = require("hardhat");

async function main() {
    const [deployer] = await ethers.getSigners();

    console.log("Deploying contracts with the account:", deployer.address);
    console.log("Account balance:", (await deployer.getBalance()).toString());

    const CNDYContract = await ethers.getContractFactory("CNDYContract");
    
    // Deploy the contract
    const cndy = await CNDYContract.deploy(deployer.address);

    // Note: The deploy() method automatically waits for the deployment to finish.
    console.log("CNDYContract deployed to:", cndy.address);
}

main().then(() => process.exit(0)).catch(error => {
    console.error(error);
    process.exit(1);
});