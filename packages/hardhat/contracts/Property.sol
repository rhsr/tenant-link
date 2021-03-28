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
  string mailingAddress;
  string zipcode;

  //should research mem implications of a uint vs specifying the smallest one possible for the use case
  //https://docs.soliditylang.org/en/v0.8.3/types.html#structs
  uint numDwellings;
  mapping (uint => Dwelling) dwellings;

  constructor (string memory _mailingAddress, string memory _zipcode) {
    mailingAddress = _mailingAddress;
    zipcode = _zipcode;
  }

  //functions
  function addDwelling(
    uint sqft
  ) 
    public
    returns (uint dwellingId)
  {
    dwellingId = numDwellings++;
    Dwelling storage d = dwellings[dwellingId];
    d.sqft = sqft;
    emit DwellingCreated(dwellingId);
  }

}
