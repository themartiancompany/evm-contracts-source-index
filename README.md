[comment]: <> (SPDX-License-Identifier: AGPL-3.0)

[comment]: <> (-------------------------------------------------------------)
[comment]: <> (Copyright © 2024, 2025  Pellegrino Prevete)
[comment]: <> (All rights reserved)
[comment]: <> (-------------------------------------------------------------)

[comment]: <> (This program is free software: you can redistribute)
[comment]: <> (it and/or modify it under the terms of the GNU Affero)
[comment]: <> (General Public License as published by the Free)
[comment]: <> (Software Foundation, either version 3 of the License.)

[comment]: <> (This program is distributed in the hope that it will be useful,)
[comment]: <> (but WITHOUT ANY WARRANTY; without even the implied warranty of)
[comment]: <> (MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the)
[comment]: <> (GNU Affero General Public License for more details.)

[comment]: <> (You should have received a copy of the GNU Affero General Public)
[comment]: <> (License along with this program.)
[comment]: <> (If not, see <https://www.gnu.org/licenses/>.)


# Ethereum Virtual Machine (EVM) Smart Contracts Source Index

The Ethereum Virtual Machine (EVM)
Smart Contracts Source Index
is a decentralized, undeletable, uncensorable,
network-neutral and network-indipendent Ethereum
Virtual Machine (EVM) compatible networks' smart
contracts' source code index.

It integrates with the
[EVM Wallet](
  https://github.com/themartiancompany/evm-wallet)
and leverages the
[Ethereum Virtual Machine File System](
  https://github.com/themartiancompany/evmfs)
(EVMFS) to host contracts' source code directly
on-chain.

It is a free (as in freedom) neutral,
network-independent replacement for
centralized, network-specific EIP-3091
networks explorers contracts source code
verification systems, which have become
de facto a bottleneck and a security
vulnerability for EVM networks.

Before uploading, source code is compressed and signed
against deployers or users' 
[EVM GNU Privacy Guard](
  https://github.com/themartiancompany/evm-gnupg)
keys published on the
[EVM OpenPGP Key Server](
  https://github.com/themartiancompany/evm-openpgp-keyserver),
so to avoid users from potentially
malevolent RPC endpoints and
man-in-the-middle attacks.

It depends on the
[EVM Contracts Tools](
  https://github.com/themartiancompany/evm-contracts-tools)
to interact with EVM networks and it is
written using the
[LibEVM](
  https://github.com/themartiancompany/libevm)
and the
[Crash Bash](
  https://github.com/themartiancompany/crash-bash)
libraries.

### Installation

The program can be installed with a simple

```bash
make
make \
  install
```

Being the program written using the EVM Toolchain,
the build procedure requires
[EVM Make](
  https://github.com/themartiancompany/evm-make)
and
[Solidity Compiler](
  https://github.com/themartiancompany/solidity-compiler)
to be installed and available on the system.

### Usage

To upload the source code for
a contract one can type

```bash
evm-contracts-source-index-publish \
  -v \
  <contract_network> \
  <contract_address> \
  <contract_source> \
  <evm_version> \
  <compiler> \
  <compiler_version>
```

while to retrieve the source code one can
type

```bash
evm-contracts-source-index-get \
  -t \
    'source' \
  <contract_network> \
  <contract_address>
```

parameters for the `-t` output type option are
`source`, `evm_version`, `compiler`,
`compiler_version`.

For further information and options consult
the manuals

```bash
man \
  evm-contract-source-publish
man \
  evm-contract-source-get
```

or run the commands with the `-h` help option.

## License

This program is released under the terms of the GNU
Affero General Public License version 3.0.
