pragma solidity >=0.6.0 <0.9.0;
// SPDX-License-Identifier: MIT

import "hardhat/console.sol";

//should this be an interface instead? 
//https://docs.soliditylang.org/en/v0.8.3/contracts.html#abstract-contracts 
//https://docs.soliditylang.org/en/v0.8.3/contracts.html#interfaces

abstract contract Property {

  //events, what can happen to a property


  constructor () {

  }

  //functions

}

contract House is Property {

}

//may not need this second level of House hierarchy
//we can always consolidate when we understand the biz logic diff if any exists

contract SingleFamilyHouse is House {

}

contract MultiFamilyHouse is House {

}

contract ApartmentBuilding is Property {

}
