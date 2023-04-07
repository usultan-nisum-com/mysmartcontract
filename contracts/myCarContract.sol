// SPDX-License-Identifier: MIT

pragma solidity >=0.7.3;

contract MyCarContract {

 struct CarInformation {
        string name;
        uint32 modal;
        uint64 price;
        bool isAvailableForSell;
        address owner;
    }

    mapping (uint256 => CarInformation) public informationMap;

    function storeInformation(uint256 number, string memory name, uint32 modal,uint64 price, bool isAvailableForSell) public {
        informationMap[number] = CarInformation(name, modal, price,isAvailableForSell, msg.sender);
    }

    function retrieveInformation(uint256 number) public view returns (string memory, uint32,uint64, bool, address) {
        return (informationMap[number].name, informationMap[number].modal, informationMap[number].price,informationMap[number].isAvailableForSell, informationMap[number].owner);
    }

    function transferOwner(uint256 number, address newOwner) public {
        require(msg.sender == informationMap[number].owner, "Only car owner can transfer");
        informationMap[number].owner = newOwner;
    }
}