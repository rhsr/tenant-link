pragma solidity >=0.6.0 <0.9.0;
// SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "./Dwelling.sol";

//should this be an interface instead? 
//https://docs.soliditylang.org/en/v0.8.3/contracts.html#abstract-contracts 
//https://docs.soliditylang.org/en/v0.8.3/contracts.html#interfaces

contract Property {

  enum VerificationStatus { AwaitingDocumentation, Pending, Approved, Rejected }

  //events, what can happen to a property
  event DwellingAdded(uint dwellingId);
  event VerificationSubmitted(address sender);
  event VerificationApproved(address sender);
  event VerificationRejected(address sender);

  //attributes
  VerificationStatus verificationStatus = VerificationStatus.AwaitingDocumentation;
  string name;
  uint noFloors;
  bool hasBackyard;
  bool hasElevator;
  string streetAddress;
  string city;
  string zipcode;

  //should research mem implications of a uint vs specifying the smallest one possible for the use case
  //https://docs.soliditylang.org/en/v0.8.3/types.html#structs
  uint numDwellings;
  mapping (uint => Dwelling) dwellings;

  constructor (
    string memory _name,
    uint _noFloors,
    bool _hasBackyard,
    bool _hasElevator,
    string memory _streetAddress,
    string memory _city, 
    string memory _zipcode
  ) {
    name = _name;
    noFloors = _noFloors;
    hasBackyard = _hasBackyard;
    hasElevator = _hasElevator;
    streetAddress = _streetAddress;
    city = _city;
    zipcode = _zipcode;
  }

  //functions
  function addDwelling(
    uint squareFeet,
    string calldata identifier,
    uint numBedrooms,
    uint numBathrooms,
    bool petsAllowed
  ) 
    public
    returns (uint dwellingId)
  {
    dwellingId = numDwellings++;
    Dwelling storage d = dwellings[dwellingId];
    d.squareFeet = squareFeet;
    d.identifier = identifier;
    d.numBedrooms = numBedrooms;
    d.numBathrooms = numBathrooms;
    d.petsAllowed = petsAllowed;
    emit DwellingAdded(dwellingId);
  }

}
