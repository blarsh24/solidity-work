// SPDX-License_Identifier: MIT 

pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory is SimpleStorage {
    
    SimpleStorage[] public simpleStorageArray;
    
    // SimpleStorage refers to the imported "./SimpleStorage.sol"
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }
    
    // need address + ABI
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber);
    }
    
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrieve();
    }
} 