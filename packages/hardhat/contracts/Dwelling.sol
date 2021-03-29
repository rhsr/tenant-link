pragma solidity >=0.6.0 <0.9.0;
// SPDX-License-Identifier: MIT

struct Dwelling {
  int16 squareFeet;
  string identifier; //4A, 4, N, etc
  int8 numBedrooms;
  int8 numBathrooms;
  bool petsAllowed;
}
