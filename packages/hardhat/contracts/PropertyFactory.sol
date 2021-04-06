pragma solidity >=0.6.0 <0.9.0;
// SPDX-License-Identifier: MIT

import 'hardhat/console.sol';
import './Property.sol';

contract PropertyFactory {
  //events
  event PropertyCreated(address sender, address property, string name);

  //attributes
  Property[] properties;

  function getPropertyAddresses() public view returns(address[] memory _propertyAddresses){
    _propertyAddresses = new address[](properties.length);
    for(uint i=0;i<properties.length; i++){
      _propertyAddresses[i] = address(properties[i]);  
    }
  }

  function createProperty(
    string calldata name,
    uint8 noFloors,
    bool hasBackyard,
    bool hasElevator,
    string calldata streetAddress,
    string calldata city,
    string calldata zipcode
  ) public propertyOwnershipVerified() {
    Property p =
      new Property(name, noFloors, hasBackyard, hasElevator, streetAddress, city, zipcode);
    properties.push(p);
    emit PropertyCreated(msg.sender, address(p), name);
  }

  modifier propertyOwnershipVerified() {
    require(true, 'Sender not authorized.');
    _;
  }
}
