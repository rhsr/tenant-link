pragma solidity >=0.6.0 <0.9.0;
// SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "./Property.sol";

contract PropertyFactory {

  enum PropertyType { ApartmentBuilding, House }

  //events
  event PropertyCreated(address sender, string purpose);

  //attributes
  Property[] properties;

  function createProperty(PropertyType propertyType) 
    public 
    propertyOwnershipVerified() 
  {
    if (propertyType == PropertyType.ApartmentBuilding) {
      console.log("Its an apt building bro");
    } else if (propertyType == PropertyType.House) {
      console.log("Its a house bro");
    } else {
      console.log("wtf is it dawg idek");
    }
    ///do some stuff
    // properties.push(newProperty);
  }

  modifier propertyOwnershipVerified() {
    require(
      true, 
      "Sender not authorized."
    );
    _;
  }

}
