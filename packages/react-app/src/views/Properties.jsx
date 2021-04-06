import React, { useState } from "react";
import { Property } from "../components";

export default function Properties(props) {
  const propertyAddresses = props.propertyAddresses;
  if (propertyAddresses) {
    const properties = propertyAddresses.map((propertyAddress) =>
      <li key={propertyAddress}>
        <Property 
          address={propertyAddress}
          signer={props.signer}
          provider={props.localProvider}
          blockExplorer={props.blockExplorer}
        />
      </li>
    );
    return (
      <ul>{properties}</ul>
    )
  }
  return (
    <b>OOPSIES</b>
  )
}