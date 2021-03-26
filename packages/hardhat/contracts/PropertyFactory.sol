pragma solidity >=0.6.0 <0.9.0;
// SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "./Property.sol";

contract PropertyFactory {

  //events
  event PropertyCreated(address sender, string purpose);

  //attributes
  Property[] properties;

  function createProperty(
    string calldata mailingAddress,
    string calldata zipcode
  ) 
    public 
    propertyOwnershipVerified() 
  {
    console.log("Property gang");
    Property p = new Property(mailingAddress, zipcode);
    properties.push(p);
  }

  modifier propertyOwnershipVerified() {
    require(
      true, 
      "Sender not authorized."
    );
    _;
  }

}
