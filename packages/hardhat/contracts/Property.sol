pragma solidity >=0.6.0 <0.9.0;
// SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "./Dwelling.sol";

contract Property {
    enum VerificationStatus {AwaitingDocumentation, Pending, Approved, Rejected}

    //events, what can happen to a property
    event DwellingAdded(uint256 dwellingId);
    event VerificationSubmitted(address sender);
    event VerificationApproved(address sender);
    event VerificationRejected(address sender);

    //attributes
    VerificationStatus verificationStatus =
        VerificationStatus.AwaitingDocumentation;
    string name;

    int8 numFloors;
    bool hasBackyard;
    bool hasElevator;
    string streetAddress;
    string city;
    string zipcode;

    //should research mem implications of a uint vs specifying the smallest one possible for the use case
    //https://docs.soliditylang.org/en/v0.8.3/types.html#structs
    uint256 numDwellings;
    mapping(uint256 => Dwelling) dwellings;

    constructor(
        string memory _name,
        int8 _numFloors,
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
        int16 squareFeet,
        string calldata identifier,
        int8 numBedrooms,
        int8 numBathrooms,
        bool petsAllowed
    ) public returns (uint256 dwellingId) {
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

struct PropertyAttributes {
    int16 squareFeet;
    int8 numFloors;
    int8 numUnits;
    string framingType;
    string roofType;
    string streetAddress;
    string city;
    string county;
    string zipcode;
    string usState;
    int8 yearCompleted;
}

struct PropertyAmenities {
    bool hasBackyard;
    bool hasElevator;
    bool hasDoorman;
    bool hasFitnessCenter;
}
