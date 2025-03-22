#!/usr/bin/env bash

declare \
  -A \
  solc_version \
  evm_version \
  contract_address

solc_version=(
  ["1.0"]="0.8.28"
)
evm_version=(
  ["1.0"]="cancun"
)
contract_address=(
  ["1.0"]="0x265582ae4b1a52b51dbd98054a22f08663a4e0a8"
)
