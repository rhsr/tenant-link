import { useState, useEffect } from "react";
import usePoller from "./Poller";

export default function useContractReader(contract, functionName, args, pollTime, formatter, onChange) {
  let adjustPollTime = 1777;
  if (pollTime) {
    adjustPollTime = pollTime;
  } else if (!pollTime && typeof args === "number") {
    // it's okay to pass poll time as last argument without args for the call
    adjustPollTime = args;
  }

  console.log(adjustPollTime);

  const [value, setValue] = useState();
  useEffect(() => {
    if (typeof onChange === "function") {
      setTimeout(onChange.bind(this, value), 1);
    }
  }, [value, onChange]);

  usePoller(async () => {
    if (contract) {
      try {
        let newValue;
        if (args && args.length > 0) {
          newValue = await contract[functionName](...args);
        } else {
          newValue = await contract[functionName]();
        }
        if (formatter && typeof formatter === "function") {
          newValue = formatter(newValue);
        }
        // console.log("GOT VALUE",newValue)
        if (newValue !== value) {
          setValue(newValue);
        }
      } catch (e) {
        console.log(e);
      }
    }
  }, 99999, contract);

  return value;
}
