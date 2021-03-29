import { BigInt, Address } from "@graphprotocol/graph-ts"
import {
  PropertyFactory,
  PropertyCreated
} from "../generated/PropertyFactory/PropertyFactory"
import { Dwelling, Property, PropertyOwner } from "../generated/schema"

export function handlePropertyCreated(event: PropertyCreated): void {

  let propertyOwnerString = event.params.sender.toHexString()

  let propertyOwner = PropertyOwner.load(propertyOwnerString)

  if (propertyOwner == null) {
    propertyOwner = new PropertyOwner(propertyOwnerString)
    propertyOwner.address = event.params.sender
    propertyOwner.createdAt = event.block.timestamp
    propertyOwner.propertyCount = BigInt.fromI32(1)
  } else {
    propertyOwner.propertyCount = propertyOwner.propertyCount.plus(BigInt.fromI32(1))
  }

  let property = new Property(event.transaction.hash.toHex() + "-" + event.logIndex.toString())

  property.propertyOwner = propertyOwnerString
  property.name = event.params.name

  propertyOwner.save()
  property.save()
}
