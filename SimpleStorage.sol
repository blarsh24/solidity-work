// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0;

contract SimpleStorage {
 
    // this will be initalized to 0
    uint256 favoriteNumber;
    
    struct People {
        uint256 favoriteNumber;
        string name;
    }
    
    
    // considered a "dynamic array" because there is no number in the brackets
    People[] public people; 
    mapping(string => uint256) public nameToFavoriteNumber;


    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
    
    
    // view & pure do not require a blockchain transaction
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }
    
    
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
    
}