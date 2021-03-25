pragma solidity >=0.6.0 <0.9.0;
// SPDX-License-Identifier: MIT

import "hardhat/console.sol";

//should this be an interface instead? 
//https://docs.soliditylang.org/en/v0.8.3/contracts.html#abstract-contracts 
//https://docs.soliditylang.org/en/v0.8.3/contracts.html#interfaces

abstract contract Property {

  enum VerificationStatus { AwaitingDocumentation, Pending, Approved, Rejected }

  //events, what can happen to a property
  event VerificationSubmitted(address sender);
  event VerificationApproved(address sender);
  event VerificationRejected(address sender);

  //attributes
  VerificationStatus verificationStatus = VerificationStatus.AwaitingDocumentation;
  string mailingAddress;
  string zipcode;

  constructor (string memory _mailingAddress, string memory _zipcode) {
    mailingAddress = _mailingAddress;
    zipcode = _zipcode;
  }

  //functions

}
