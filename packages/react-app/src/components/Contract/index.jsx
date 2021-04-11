import React, { useMemo, useState } from "react";
import { Card } from "antd";
import { useContractLoader, useContractExistsAtAddress } from "../../hooks";
import Account from "../Account";
import DisplayVariable from "./DisplayVariable";
import FunctionForm from "./FunctionForm";

const noContractDisplay = (
  <div> 
    Nothing
  </div>
);

const isQueryable = fn => (fn.stateMutability === "view" || fn.stateMutability === "pure") && fn.inputs.length === 0;

export default function Contract({ customContract, account, gasPrice, signer, provider, name, show, price, blockExplorer, address }) {

  const contracts = useContractLoader(provider);
  console.log(name);
  let contract
  if(!customContract){
    contract = contracts ? contracts[name] : "";
    console.log(contract);
  }else{
    contract = customContract
  }

  console.log(contract);

  if(!address){
    address = contract ? contract.address : "";
  }

  console.log(address);
  const contractIsDeployed = true;
  console.log(contractIsDeployed);
  const displayedContractFunctions = useMemo(
    () =>
      contract
        ? Object.values(contract.interface.functions).filter(
            fn => fn.type === "function" && !(show && show.indexOf(fn.name) < 0),
          )
        : [],
    [contract, show],
  );

  const [refreshRequired, triggerRefresh] = useState(false)
  const contractDisplay = displayedContractFunctions.map(fn => {
    if (isQueryable(fn)) {
      // If there are no inputs, just display return value
      return <DisplayVariable key={fn.name} contractFunction={contract[fn.name]} functionInfo={fn} refreshRequired={refreshRequired} triggerRefresh={triggerRefresh}/>;
    }
    // If there are inputs, display a form to allow users to provide these
    return (
      <FunctionForm
        key={"FF" + fn.name}
        contractFunction={(fn.stateMutability === "view" || fn.stateMutability === "pure")?contract[fn.name]:contract.connect(signer)[fn.name]}
        functionInfo={fn}
        provider={provider}
        gasPrice={gasPrice}
        triggerRefresh={triggerRefresh}
      />
    );
  });

  return (
    <div style={{ margin: "auto", width: "70vw" }}>
      <Card
        title={
          <div>
            {name}
            <div style={{ float: "right" }}>
              <Account
                address={address}
                localProvider={provider}
                injectedProvider={provider}
                mainnetProvider={provider}
                price={price}
                blockExplorer={blockExplorer}
              />
              {account}
            </div>
          </div>
        }
        size="large"
        style={{ marginTop: 25, width: "100%" }}
        loading={contractDisplay && contractDisplay.length <= 0}
      >
        {contractIsDeployed ? contractDisplay : noContractDisplay}
      </Card>
    </div>
  );
}
