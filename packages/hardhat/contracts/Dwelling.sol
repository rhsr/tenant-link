pragma solidity >=0.6.0 <0.9.0;
// SPDX-License-Identifier: MIT

struct Dwelling {
  address tenant;
  string identifier; //4A, 4, N, etc
  DwellingAttributes attributes;
  DwellingAmenities amenities;
}

struct DwellingAttributes {
  uint16 squareFeet;
  uint8 numBedrooms;
  uint8 numBathrooms;
  string heatingType;
  string coolingType;
}

struct DwellingAmenities {
  bool inUnitWasher;
  bool inUnitDryer;
  bool petsAllowed;
}
