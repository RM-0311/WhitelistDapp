const { ethers } = require("hardhat");

async function main () {
    // contractFactory

    const whitelistContract = await ethers.getContractFactory("Whitelist");

    // deploy
    const deployedWhitelistContract = await whitelistContract.deploy(10);
    // 10 is the max number of whitelisted addresses

    await deployedWhitelistContract.deployed();

    console.log(
        "Whitelist Contract Address:",
        deployedWhitelistContract.address
    );
}

// Call the main function and catch if there is any error
main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });