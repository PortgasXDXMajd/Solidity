//SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "./simple_storage.sol";

contract StorageFactory is SimpleStorage {
    SimpleStorage[] public simpleStorageArray; 
    function createNewSimpleStorage() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    function sfAddPerson(uint256 index, string memory n, uint a )public {
        SimpleStorage(address(simpleStorageArray[index])).addPerson(n,a);
    }

    function sfStore(uint256 index, uint favNumber )public {
        SimpleStorage(address(simpleStorageArray[index])).store(favNumber);
    }

    function sfGet(uint256 index) public view returns(uint) {
        return SimpleStorage(address(simpleStorageArray[index])).retrieve();
    }
    function sfGetName(uint256 index, uint peopleArrayIndex) public view returns(string memory) {
        return SimpleStorage(address(simpleStorageArray[index])).getPersonName(peopleArrayIndex);
    }

}