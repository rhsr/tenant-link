pragma solidity >=0.6.0 <0.9.0;
// SPDX-License-Identifier: MIT

import "hardhat/console.sol";

contract RentalAgreement {

  enum RentalAgreementStatus 
    { 
      PendingApplication, 
      ApplicationSubmitted, 
      ApplicationRejected, 
      ApplicationApproved
      ///more required 
    }
  
  address payable landlord;
  address payable tenant;

  int8 gracePeriodDays;
  int16 rentUsd;
  int16 lateFeeUsd;
  int16 depositUsd;

}
