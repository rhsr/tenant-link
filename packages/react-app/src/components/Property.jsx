import React, { useState } from "react";
import { loadContract } from "../hooks";
import Contract from "./Contract";


export default function Property(props) {
  console.log(props.address)
  if (props.address) {
    return (
      <Contract
        name="Property"
        signer={props.signer}
        provider={props.localProvider}
        address={props.address}
        blockExplorer={props.blockExplorer}
        customContract={loadContract("Property", props.signer, props.address)}
      />
    )
  }
  return (
    <b>Howdy Pardner!</b>
  )
}