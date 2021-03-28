pragma solidity >=0.6.0 <0.9.0;
// SPDX-License-Identifier: MIT

struct Dwelling {
  uint squareFeet;
  string identifier; //4A, 4, N, etc
  uint numBedrooms;
  uint numBathrooms;
  bool petsAllowed;
}
