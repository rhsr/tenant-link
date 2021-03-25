pragma solidity >=0.6.0 <0.9.0;
// SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "./Property.sol";
import "./Apartment.sol";

contract ApartmentBuilding is Property {

  //events

  //attributes
  Apartment[] apartments;

  constructor(
    string memory _mailingAddress,
    string memory _zipcode
  ) 
    Property(_mailingAddress, _zipcode) 
  {
    console.log("got an apartment building on chain, pretty sick tbh");
  }

}
