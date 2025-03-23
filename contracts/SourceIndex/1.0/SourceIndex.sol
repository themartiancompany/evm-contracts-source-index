// SPDX-License-Identifier: AGPL-3.0

//    ----------------------------------------------------------------------
//    Copyright © 2024, 2025  Pellegrino Prevete
//
//    All rights reserved
//    ----------------------------------------------------------------------
//
//    This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU Affero General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU Affero General Public License for more details.
//
//    You should have received a copy of the GNU Affero General Public License
//    along with this program.  If not, see <https://www.gnu.org/licenses/>.

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Source Index
 * @dev On-chain index for smart contracts'
 *      source code. 
 */
contract SourceIndex {

    address public immutable deployer = 0xea02F564664A477286B93712829180be4764fAe2;
    string public hijess = "marryme";

    mapping(
      address => mapping (
        uint256 => mapping(
          address => string ) ) ) public evmVersion;
    mapping(
      address => mapping (
        uint256 => mapping(
          address => string ) ) ) public compiler; 
    mapping(
      address => mapping (
        uint256 => mapping(
          address => string ) ) ) public compilerVersion;
    mapping(
      address => mapping (
        uint256 => mapping(
          address => string ) ) ) public source;
    mapping(
      address => mapping (
        uint256 => mapping(
          address => bool ) ) ) public lock;
    constructor() {}

    /**
     * @dev Check owner.
     * @param _publisher Publisher address.
     */
    function checkOwner(
      address _publisher)
      public
      view {
      require(
        msg.sender == _publisher
      );
    }

    /**
     * @dev Check contract source unlock state.
     * @param _publisher User publishing the contract.
     * @param _chainId ID of the blockchain for which
     *                 the contract address is provided.
     * @param _contractAddress Address of the contract for
     *                         which the source is provided.
     */
    function checkUnlocked(
      address _publisher,
      uint256 _chainId,
      address _contractAddress)
      public
      view {
      require(
        ! lock[
            _publisher][
              _chainId][
                _contractAddress]
      );
    }

    /**
     * @dev Check contract source lock state.
     * @param _publisher User publishing the contract.
     * @param _chainId ID of the blockchain for which the
     *                 contract address is provided.
     * @param _contractAddress Address of the contract for
     *                         which the source is provided.
     */
    function checkLocked(
      address _publisher,
      uint256 _chainId,
      address _contractAddress)
      public
      view {
      require(
        lock[
          _publisher][
            _chainId][
              _contractAddress]
      );
    }

    /**
     * @dev Check an URI is an EVMFS resource.
     * @param _uri The URI to check.
     */
    function checkUri(
      string memory _uri)
      internal
      pure {
      bytes memory _prefix =
        bytes(
          "evmfs://");
      bytes memory _uri_prefix =
        new bytes(
          8);
      for(
        uint _i = 0;
        _i <= 7;
        _i++){
        _uri_prefix[
          _i] =
          bytes(
	    _uri)[
              _i];
      }
      require(
	_uri_prefix.length == _prefix.length &&
        keccak256(
          _uri_prefix) == keccak256(
                            _prefix),
	"Input is not an EVMFS uri.");
    }

    /**
     * @dev Publishes all data for a contract with a single call.
     * @param _publisher User publishing the contract.
     * @param _chainId ID of the blockchain for which
     *                 the contract address is provided.
     * @param _contractAddress Address of the contract for
     *                         which the source is provided.
     * @param _source Ethereum Virtual Machine File System
     *                link to the source code of the contract.
     * @param _evmVersion Ethereum Virtual Machine version
     *                    for which the contract has been built.
     * @param _compiler Compiler which has been used
     *                  to build the source code.
     * @param _compilerVersion Compiler used to build the contract.
     */
    function publish(
      address _publisher,
      uint256 _chainId,
      address _contractAddress,
      string memory _source,
      string memory _evmVersion,
      string memory _compiler,
      string memory _compilerVersion) public {
      checkOwner(
        _publisher);
      checkUnlocked(
        _publisher,
        _chainId,
        _contractAddress);
      checkUri(
        _source);
      source[
        _publisher][
          _chainId][
            _contractAddress] =
        _source;
      evmVersion[
        _publisher][
          _chainId][
            _contractAddress] =
        _evmVersion;
      compiler[
        _publisher][
          _chainId][
            _contractAddress] =
        _compiler;
      compilerVersion[
        _publisher][
          _chainId][
            _contractAddress] =
        _compilerVersion;  
    }

    /**
     * @dev Publishes source code for a contract.
     * @param _publisher User publishing the contract.
     * @param _chainId ID of the blockchain for which
     *                 the contract address is provided.
     * @param _contractAddress Address of the contract for
     *                         which the source is provided.
     * @param _source Ethereum Virtual Machine File System
     *                link to the source code of the contract.
     */
    function publishSource(
      address _publisher,
      uint256 _chainId,
      address _contractAddress,
      string memory _source) public {
      checkOwner(
        _publisher);
      checkUnlocked(
        _publisher,
        _chainId,
        _contractAddress);
      checkUri(
        _source);
      source[
        _publisher][
          _chainId][
            _contractAddress] =
        _source;
    }

    /**
     * @dev Publishes Ethereum Virtual Machine version for a contract.
     * @param _publisher User publishing the contract.
     * @param _chainId ID of the blockchain for which
     *                 the contract address is provided.
     * @param _contractAddress Address of the contract for
     *                         which the source is provided.
     * @param _evmVersion Ethereum Virtual Machine version
     *                    for which the contract has been built.
     */
    function publishEvmVersion(
      address _publisher,
      uint256 _chainId,
      address _contractAddress,
      string memory _evmVersion) public {
      checkOwner(
        _publisher);
      checkUnlocked(
        _publisher,
        _chainId,
        _contractAddress);
      evmVersion[
        _publisher][
          _chainId][
            _contractAddress] =
        _evmVersion;
    }

    /**
     * @dev Publishes reference compiler for a contract.
     * @param _publisher User publishing the contract.
     * @param _chainId ID of the blockchain for which
     *                 the contract address is provided.
     * @param _contractAddress Address of the contract
     *                         for which the source is provided.
     * @param _compiler Compiler which has been used
     *                  to build the source code.
     */
    function publishCompiler(
      address _publisher,
      uint256 _chainId,
      address _contractAddress,
      string memory _compiler) public {
      checkOwner(
        _publisher);
      checkUnlocked(
        _publisher,
        _chainId,
        _contractAddress);
      compiler[
        _publisher][
          _chainId][
            _contractAddress] =
        _compiler;
    }

    /**
     * @dev Publishes compiler version for a contract.
     * @param _publisher User publishing the contract.
     * @param _chainId ID of the blockchain for which
     *                 the contract address is provided.
     * @param _contractAddress Address of the contract
     *                         for which the source is provided.
     * @param _compilerVersion Compiler used to build the contract.
     */
    function publishCompilerVersion(
      address _publisher,
      uint256 _chainId,
      address _contractAddress,
      string memory _compilerVersion) public {
      checkOwner(
        _publisher);
      checkUnlocked(
        _publisher,
        _chainId,
        _contractAddress);
      compilerVersion[
        _publisher][
          _chainId][
            _contractAddress] =
        _compilerVersion;  
    }

    /**
     * @dev Lock the contract source.
     * @param _chainId ID of the blockchain for which
     *                 the contract address is provided.
     * @param _contractAddress Address of the contract
     *                         the source code is to lock.
     */
    function lockSource(
      address _publisher,
      uint256 _chainId,
      address _contractAddress)
    public
    {
      checkOwner(
        _publisher);
      checkUnlocked(
        _publisher,
        _chainId,
        _contractAddress);
      lock[
        _publisher][
          _chainId][
            _contractAddress] =
        true;
    }

    /**
     * @dev Read published source code for a contract.
     * @param _publisher User publishing the contract.
     * @param _chainId ID of the blockchain for which
     *                 the contract address is provided.
     * @param _contractAddress address of the contract
     *                         of which to retrieve the source
     *                         code EVMFS address.
     */
    function readSource(
      address _publisher,
      uint256 _chainId,
      address _contractAddress)
    public
    view
    returns (string memory)
    {
      checkLocked(
        _publisher,
        _chainId,
        _contractAddress);
      return source[
               _publisher][
                 _chainId][
                   _contractAddress];
    }

    /**
     * @dev Read published Ethereum Virtual Machine target
     *      version for a contract.
     * @param _publisher User publishing the contract.
     * @param _chainId ID of the blockchain for which the
     *                 contract address is provided.
     * @param _contractAddress address of the contract of
     *                         which to retrieve the EVM version
     *                         it targets.
     */
    function readEvmVersion(
      address _publisher,
      uint256 _chainId,
      address _contractAddress)
    public
    view
    returns (string memory)
    {
      checkLocked(
        _publisher,
        _chainId,
        _contractAddress);
      return evmVersion[
               _publisher][
                 _chainId][
                   _contractAddress];
    }

    /**
     * @dev Read published compiler used to build a given contract.
     * @param _publisher User publishing the contract.
     * @param _chainId ID of the blockchain for which the contract
     *                 address is provided.
     * @param _contractAddress Address of the contract of which
     *                         to retrieve the compiler used to
     *                         build it.
     */
    function readCompiler(
      address _publisher,
      uint256 _chainId,
      address _contractAddress)
    public
    view
    returns (string memory)
    {
      checkLocked(
        _publisher,
        _chainId,
        _contractAddress);
      return compiler[
               _publisher][
                 _chainId][
                   _contractAddress];
    }

    /**
     * @dev Read published compiler version used to build a
     *      given contract.
     * @param _publisher User publishing the contract.
     * @param _chainId ID of the blockchain for which the
     *                 contract address is provided.
     * @param _contractAddress Address of the contract of which
     *                         to retrieve the compiler version
     *                         used to build it.
     */
    function readCompilerVersion(
      address _publisher,
      uint256 _chainId,
      address _contractAddress)
    public
    view
    returns (string memory)
    {
      checkLocked(
        _publisher,
        _chainId,
        _contractAddress);
      return compilerVersion[
               _publisher][
                 _chainId][
                   _contractAddress];
    }
}
