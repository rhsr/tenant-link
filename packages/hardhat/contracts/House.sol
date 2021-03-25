pragma solidity >=0.6.0 <0.9.0;
// SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "./Property.sol";

contract House is Property {

  //events

  //attributes

  constructor(
    string memory _mailingAddress,
    string memory _zipcode
  ) 
    Property(_mailingAddress, _zipcode) 
  {
    console.log("got a house on chain, pretty sick tbh");
  }

}
