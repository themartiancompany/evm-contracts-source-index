// SPDX-License-Identifier: AGPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Contract Index
 * @dev On-chain index for smart contracts'
 *      source code. .
 */
contract ContractIndex {

    address public immutable deployer = 0xea02F564664A477286B93712829180be4764fAe2;
    string public hijess = "marryme";

    mapping(address => mapping (uint256 => mapping(address => string))) public evmVersion;
    mapping(address => mapping (uint256 => mapping(address => string))) public compiler; 
    mapping(address => mapping (uint256 => mapping(address => string))) public compilerVersion;
    mapping(address => mapping (uint256 => mapping(address => string))) public source;
    mapping(address => mapping (uint256 => mapping(address => bool))) public lock;
    constructor() {}

    /**
     * @dev Check owner.
     * @param _publisher Publisher address.
     */
    function checkOwner(
      address _publisher)
      public
      view {
      require( msg.sender == _publisher );
    }


    /**
     * @dev Check contract source unlock state.
     * @param _publisher User publishing the contract.
     * @param _chainId ID of the blockchain for which the contract address is provided.
     * @param _contractAddress Address of the contract for which the source is provided.
     */
    function checkUnlocked(
      address _publisher,
      uint256 _chainId,
      address _contractAddress)
      public
      view {
      require(
        ! lock[_publisher][_chainId][_contractAddress]
      );
    }

    /**
     * @dev Check contract source lock state.
     * @param _publisher User publishing the contract.
     * @param _chainId ID of the blockchain for which the contract address is provided.
     * @param _contractAddress Address of the contract for which the source is provided.
     */
    function checkLocked(
      address _publisher,
      uint256 _chainId,
      address _contractAddress)
      public
      view {
      require(
	      lock[_publisher][_chainId][_contractAddress]
      );
    }

    /**
     * @dev Publishes source code for a contract.
     * @param _publisher User publishing the contract.
     * @param _chainId ID of the blockchain for which the contract address is provided.
     * @param _contractAddress Address of the contract for which the source is provided.
     * @param _source Ethereum Virtual Machine File System link to the source code of the contract.
     */
    function postSource(
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
	    source[_publisher][_chainId][_contractAddress] = _source;
    }

    /**
     * @dev Publishes Ethereum Virtual Machine version for a contract.
     * @param _publisher User publishing the contract.
     * @param _chainId ID of the blockchain for which the contract address is provided.
     * @param _contractAddress Address of the contract for which the source is provided.
     * @param _evmVersion Ethereum Virtual Machine version for which the contract has been built.
     */
    function postEvmVersion(
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
      evmVersion[_publisher][_chainId][_contractAddress] = _evmVersion;
    }

    /**
     * @dev Publishes reference compiler for a contract.
     * @param _publisher User publishing the contract.
     * @param _chainId ID of the blockchain for which the contract address is provided.
     * @param _contractAddress Address of the contract for which the source is provided.
     * @param _compiler Compiler which has been used to build the source code.
     */
    function postCompiler(
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
      compiler[_publisher][_chainId][_contractAddress] = _compiler;
    }

    /**
     * @dev Publishes compiler version for a contract.
     * @param _publisher User publishing the contract.
     * @param _chainId ID of the blockchain for which the contract address is provided.
     * @param _contractAddress Address of the contract for which the source is provided.
     * @param _compilerVersion Compiler used to build the contract.
     */
    function postCompilerVersion(
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
      compilerVersion[_publisher][_chainId][_contractAddress] = _compilerVersion;  
    }

    /**
     * @dev Lock the contract source.
     * @param _chainId ID of the blockchain for which the contract address is provided.
     * @param _contractAddress Address of the contract the source code is to lock.
     */
    function lockContract(
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
      lock[_publisher][_chainId][_contractAddress] = true;
    }

    /**
     * @dev Read published source code for a contract.
     * @param _publisher User publishing the contract.
     * @param _chainId ID of the blockchain for which the contract address is provided.
     * @param _contractAddress address of the contract of which to retrieve the source code evmfs address.
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
      return source[_publisher][_chainId][_contractAddress];
    }

    /**
     * @dev Read published Ethereum Virtual Machine target version for a contract.
     * @param _publisher User publishing the contract.
     * @param _chainId ID of the blockchain for which the contract address is provided.
     * @param _contractAddress address of the contract of which to retrieve the EVM version it targets.
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
      return evmVersion[_publisher][_chainId][_contractAddress];
    }

    /**
     * @dev Read published compiler used to build a given contract.
     * @param _publisher User publishing the contract.
     * @param _chainId ID of the blockchain for which the contract address is provided.
     * @param _contractAddress address of the contract of which to retrieve the compiler used to build it.
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
      return compiler[_publisher][_chainId][_contractAddress];
    }

    /**
     * @dev Read published compiler version used to build a given contract.
     * @param _publisher User publishing the contract.
     * @param _chainId ID of the blockchain for which the contract address is provided.
     * @param _contractAddress address of the contract of which to retrieve the compiler version used to build it.
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
      return compilerVersion[_publisher][_chainId][_contractAddress];
    }
}
