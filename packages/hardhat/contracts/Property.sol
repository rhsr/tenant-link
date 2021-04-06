pragma solidity >=0.6.0 <0.9.0;
// SPDX-License-Identifier: MIT

import 'hardhat/console.sol';
import './Dwelling.sol';

contract Property {
  enum VerificationStatus { AwaitingDocumentation, Pending, Approved, Rejected }

  //events, what can happen to a property
  event DwellingAdded(uint16 dwellingId);
  event VerificationSubmitted(address sender);
  event VerificationApproved(address sender);
  event VerificationRejected(address sender);

  uint8 numFloors;
  bool hasBackyard;
  bool hasElevator;
  string name;
  string streetAddress;
  string city;
  string zipcode;

  uint16 numDwellings;
  mapping(uint16 => Dwelling) dwellings;

  constructor(
    string memory _name,
    uint8 _numFloors,
    bool _hasBackyard,
    bool _hasElevator,
    string memory _streetAddress,
    string memory _city,
    string memory _zipcode
  ) {
    name = _name;
    numFloors = _numFloors;
    hasBackyard = _hasBackyard;
    hasElevator = _hasElevator;
    streetAddress = _streetAddress;
    city = _city;
    zipcode = _zipcode;
  }

  //functions
  function addDwelling(
    uint16 squareFeet,
    string calldata identifier,
    uint8 numBedrooms,
    uint8 numBathrooms,
    bool petsAllowed
  ) public returns (uint16 dwellingId) {
    dwellingId = numDwellings++;
    Dwelling storage d = dwellings[dwellingId];
    d.identifier = identifier;
    d.attributes.squareFeet = squareFeet;
    d.attributes.numBedrooms = numBedrooms;
    d.attributes.numBathrooms = numBathrooms;
    d.amenities.petsAllowed = petsAllowed;
    emit DwellingAdded(dwellingId);
  }
}
