..
   SPDX-License-Identifier: AGPL-3.0-or-later

   ----------------------------------------------------------------------
   Copyright © 2024, 2025  Pellegrino Prevete

   All rights reserved
   ----------------------------------------------------------------------

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU Affero General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU Affero General Public License for more details.

   You should have received a copy of the GNU Affero General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.


====================================
evm-contract-source-verify
====================================

--------------------------------------------------------------------------------
Ethereum Virtual Machine (EVM) smart contracts Source Index verify tool
--------------------------------------------------------------------------------
:Version: evm-contract-source-verify |version|
:Manual section: 1

Synopsis
========

evm-contract-source-verify
  *[options]*
  *contract_network*
  *contract_address*


Description
===========

EVM networks contracts' Source Index contract verification tool.
It integrates with EVM Wallet and retrieves code
from the Ethereum Virtual Machine File System
(EVMFS).
It uses the EVM Contracts Tools to interact with
the networks and it is written using the LibEVM 
and Crash Bash libraries.

It currently verifies a contract runtime
bytecode is the same as the one generated
by locally building the provided source
or the one retrieved from the Source Index.

Networks
========

The list of supported networks can be
consulted using *evm-chains-info*.


Options
========

-i contract_file          If not specified will try to get
                          it from the Source Index.
-b bytecode_verify        It can be 'runtime',
-P target_publisher       Target source publisher.
                          It defaults to the contract 
                          deployer's self-published entry.
-e evm_version            EVM version for the contract.
-S solc_version           Solc version for the contract.
                          If not specified will attempt
                          to get one from the index.
-T tx_deployment          Deployment transaction for this contract.
                          If not specified will try to get
                          it from the Source Index.


Contract options
=================

-A si_address             Address of the 'Source Index'
                          contract on the network.
-V si_version             Version of the target 'Source Index'
                          contract.


LibEVM options
================

-u                        Whether to retrieve publishers' contract
                          address from user directory or custom
                          deployment.
-d deployments_dir        Contracts deployments directory.
-n network                EVM network name.


Credentials options
====================

-N wallet_name            Wallet name.
-w wallet_path            Wallet path.
-p wallet_password        Wallet password.
-s wallet_seed            Wallet seed path.
-k api_key                Etherscan-like service key.


Application options
====================

-H gnupg_home             GNUPG home directory.

-h                        Display help.
-c                        Enable color output
-v                        Enable verbose output


Bugs
====

https://github.com/themartiancompany/evm-contracts-source-index/-/issues

Copyright
=========

Copyright Pellegrino Prevete. AGPL-3.0.

See also
========

* evm-contract-bytecode-get
* evm-contract-source-get
* evm-contract-source-publish
* evm-openpgp-key-receive
* evm-deployer
* evmfs
* evm-wallet
* evm-chains-info
* libevm
* crash-bash

.. include:: variables.rst
