//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Whitelist {

    // Max number of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    // Mapping of whitelisted addresses
    // if an address is whitelisted, set it to true, it is false by default for all other addresses.
    mapping(address => bool) public whitelistedAddresses;

    // numAddressesWhitelisted would be used to keep track of how many have been whitelisted
    uint8 public numAddressesWhitelisted;

    // Setting the max number of whitelisted addresses
    // User will put the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    /**
    addAddressToWhitelist - This function adds the address of the sender to the whitelist
    */
    function addAddressToWhitelist() public {
        // check if the user is already whitelisted
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
        // check if there are whitelist spots open
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses cannot be added, limit reached");
        // Add the address which called the function to the whitelistedAddress array
        whitelistedAddresses[msg.sender] = true;
        // Increase the number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }
}