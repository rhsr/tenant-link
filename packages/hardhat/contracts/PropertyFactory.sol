pragma solidity >=0.6.0 <0.9.0;
// SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "./Property.sol";

contract PropertyFactory {

  enum PropertyType { ApartmentBuilding, House }

  event PropertyCreated(address sender, string purpose);
  event PropertyVerificationSubmitted(address sender);
  event PropertyVerificationApproved(address sender);
  event PropertyVerificationRejected(address sender);

  Property[] properties;

  function createProperty(PropertyType propertyType) 
    public 
    propertyOwnershipVerified() 
  {
    if (propertyType == PropertyType.ApartmentBuilding) {
      console.log("Its an apt bro");
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
