pragma solidity >=0.6.0 <0.9.0;
// SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "./Property.sol";

contract PropertyFactory {

  //events
  event PropertyCreated(address sender, string name);

  //attributes
  Property[] properties;

  function createProperty(
    string calldata name,
    int8 noFloors,
    bool hasBackyard,
    bool hasElevator,
    string calldata streetAddress,
    string calldata city,
    string calldata zipcode
  ) 
    public 
    propertyOwnershipVerified() 
  {
    Property p = new Property(name, noFloors, hasBackyard, hasElevator, streetAddress, city, zipcode);
    properties.push(p);
    emit PropertyCreated(msg.sender, name);
  }

  modifier propertyOwnershipVerified() {
    require(
      true, 
      "Sender not authorized."
    );
    _;
  }

}
