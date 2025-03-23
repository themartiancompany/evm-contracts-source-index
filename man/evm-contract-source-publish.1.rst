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
evm-contract-source-publish
====================================

--------------------------------------------------------------------------------
Ethereum Virtual Machine (EVM) smart contracts source index publishing tool
-------------------------------------------------------------------------------
:Version: evm-contract-source-publish |version|
:Manual section: 1

Synopsis
========

evm-contract-source-publish
  *[options]*
  *contract_network*
  *contract_address*
  *contract_source*
  *evm_version*
  *compiler*
  *compiler_version*


Description
===========

EVM networks contracts' source index publishing tool.
It integrates with EVM Wallet and uses the
Ethereum Virtual Machine File System
(EVMFS) for contracts' source code hosting,
so to guarantee source code persistence,
undeletability and neutrality.

Networks
========

The list of supported networks can be
consulted using *evm-chains-info*.


Options
========

-A si_address           Address of the 'Source Index'
                        contract on the network.
-V si_version           Version of the target 'Source Index'
                        contract.
-u                      Whether to retrieve publishers' contract
                        address from user directory or custom
                        deployment.
-d deployments_dir      Contracts deployments directory.
-N wallet_name          Wallet name.
-w wallet_path          Wallet path.
-p wallet_password      Wallet password.
-s wallet_seed          Wallet seed path.
-n network              EVM network name (${_networks[*]}).
-k api_key              Etherscan-like service key.
-P target_publisher     Target source publisher,
                        i.e. user's wallet address.
-U source_uri           To manually specify the signed
                        contract's source archive evmfs URI
                        and skip upload.
-S y/n                  If set to 'y', it will skip
                        recipe publishing.
-H gnupg_home           GNUPG home directory.
-K fingerprint          OpenPGP signature key.
-E email_like_id        OpenPGP signature email.

-h                      Display help.
-c                      Enable color output
-v                      Enable verbose output


Bugs
====

https://github.com/themartiancompany/evm-contracts-source-index/-/issues

Copyright
=========

Copyright Pellegrino Prevete. AGPL-3.0.

See also
========

* evm-deployer
* evmfs
* evm-wallet
* evm-chains-info

.. include:: variables.rst
