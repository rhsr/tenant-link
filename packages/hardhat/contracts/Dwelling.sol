pragma solidity >=0.6.0 <0.9.0;
// SPDX-License-Identifier: MIT

struct Dwelling {
    address tenant;
    string identifier; //4A, 4, N, etc
    DwellingAttributes attributes;
    DwellingAmenities amenities;
}

struct DwellingAttributes {
    int16 squareFeet;
    int8 numBedrooms;
    int8 numBathrooms;
    string heatingType;
    string coolingType;
}

struct DwellingAmenities {
    bool inUnitWasher;
    bool inUnitDryer;
    bool petsAllowed;
}
