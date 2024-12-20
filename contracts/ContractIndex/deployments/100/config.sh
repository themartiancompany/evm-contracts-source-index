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
  ["1.0"]="0x1f274f865f1295e3594245714aA3c8bBF4Ac25Aa"
)
