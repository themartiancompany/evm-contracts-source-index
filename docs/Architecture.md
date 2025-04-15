# Architecture

Similarly to most others
[libEVM](
  https://github.com/themartiancompany/libevm)
applications the Source Index is made up
of a set of Solidity contracts,
of their deployment configurations and of the
native computer clients used to interact
with the deployments.

For the Source Index currently there's just
a single `SourceIndex` contract.

### `SourceIndex` 1.0

For each chain ID and for each network
address, users are assigned a personal
namespace they can write contracts' data
in.

The types of data users can and should
provide for any given contract deployment
on any network are:

- `compiler`:
    the compiler with which the contract
    deployment has been built.
- `compilerVersion`:
    the compiler version with which
    the contract deployment has been built.
- `evmVersion`:
    the Ethereum Virtual Machine version the
    contract deployment has been built.
- `deploymentTransaction`:
    the hash of the transaction at which
    the contract has been deployed.
- `source`:
    the contract source code, provided
    as an
    [EVMFS](
      https://github.com/themartiancompany/evmfs)
    URI to an
    [EVM GPG signed](
      https://github.com/themartiancompany/evm-gnupg),
    zlib-compressed, tar archive,
    the signing key of which has been correctly published on the
    [EVM Contracts' Source Index](
      https://github.com/themartiancompany/evm-contracts-source-index),
    containing a solidity source code file named the same
    as the contract address  (`0xloveu.sol.tar.xz.gpg`).

After the data has been checked by the
publishing tool it is locked to avoid
a posteriori security breaches.

The full contract source file is in
the `contracts/SourceIndex/1.0` directory.

After being published with
`evm-contract-source-publish`, sources
can then be retrieved with
`evm-contract-source-get`.

By default, downloaded sources are built
locally and their runtime bytecode is compared
to the target contract deployed bytecode;
if the bytecodes are the same the source is
considered valid and stored at a safe
location on the system.

Currently this limits the validity of the
verify procedure, which is performed
by `evm-contract-source-verify` only to
contracts which are deployed non-parametrically.
