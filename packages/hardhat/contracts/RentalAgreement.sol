pragma solidity >=0.6.0 <0.9.0;
// SPDX-License-Identifier: MIT

import 'hardhat/console.sol';

contract RentalAgreement {
  enum RentalAgreementStatus {
    PendingApplication,
    ApplicationSubmitted,
    ApplicationRejected,
    ApplicationApproved
    ///more required
  }

  address payable landlord;
  address payable tenant;

  uint8 gracePeriodDays;
  uint16 rentUsd;
  uint16 lateFeeUsd;
  uint16 depositUsd;
}
