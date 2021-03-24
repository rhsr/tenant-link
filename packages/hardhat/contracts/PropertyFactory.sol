pragma solidity >=0.6.0 <0.9.0;
// SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "./Property.sol";

contract PropertyFactory {

  Property[] properties;

  function createProperty() 
    public 
    propertyOwnershipVerified() 
  {
    console.log("Yea I got that land bro");
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
