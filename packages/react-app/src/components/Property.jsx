import React, { useState } from "react";
import { useContractReader } from "../hooks";
import Contract from "./Contract";


export default function Property(props) {
  console.log(props.address)
  if (props.address) {
    return (
      <Contract
        name={props.address}
        signer={props.signer}
        provider={props.localProvider}
        address={props.address}
        blockExplorer={props.blockExplorer}
      />
    )
  }
  return (
    <b>Howdy Pardner!</b>
  )
}