pragma solidity >=0.6.0 <0.9.0;
// SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "./Property.sol";
import "./Apartment.sol";

contract ApartmentBuilding is Property {

  Apartment[] apartments;

}
