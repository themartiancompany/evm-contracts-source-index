// SPDX-License-Identifier: AGPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Contract Index
 * @dev On-chain index for smart contracts'
 *      source code. .
 */
contract ContractIndex {

    address public immutable deployer = 0xea02F564664A477286B93712829180be4764fAe2;
    string public hijess = "iloveu";

    mapping(address => mapping (address => string)) public evmVersion;
    mapping(address => mapping (address => string)) public compiler; 
    mapping(address => mapping (address => string)) public compilerVersion;
    mapping(address => mapping (address => string)) public source;
    constructor() {}
    
    /**
     * @dev Publishes source code for a contract.
     * @param _publisher User publishing the contract.
     * @param _contractAddress address of the contract for which the source is provided.
     * @param _source Ethereum Virtual Machine File System link to the source code of the contract.
     */
    function postSource(
      address _publisher,
      address _contractAddress,
      string memory _source) public {
      require(_publisher == msg.sender, "not ur user");
	    source[_publisher][_contractAddress] = _source;
    }

    /**
     * @dev Publishes Ethereum Virtual Machine version for a contract.
     * @param _publisher User publishing the contract.
     * @param _contractAddress address of the contract for which the source is provided.
     * @param _evmVersion Ethereum Virtual Machine version for which the contract has been built.
     */
    function postEvmVersion(
      address _publisher,
      address _contractAddress,
      string memory _evmVersion) public {
      require(_publisher == msg.sender, "not ur user");
      evmVersion[_publisher][_contractAddress] = _evmVersion;
    }

    /**
     * @dev Publishes reference compiler for a contract.
     * @param _publisher User publishing the contract.
     * @param _contractAddress address of the contract for which the source is provided.
     * @param _compiler Compiler which has been used to build the source code.
     */
    function postCompiler(
      address _publisher,
      address _contractAddress,
      string memory _compiler) public {
      require(_publisher == msg.sender, "not ur user");
      compiler[_publisher][_contractAddress] = _compiler;
    }

    /**
     * @dev Publishes compiler version for a contract.
     * @param _publisher User publishing the contract.
     * @param _contractAddress address of the contract for which the source is provided.
     * @param _compilerVersion Compiler used to build the contract.
     */
    function postCompilerVersion(
      address _publisher,
      address _contractAddress,
      string memory _compilerVersion) public {
      require(_publisher == msg.sender, "not ur user");
      compilerVersion[_publisher][_contractAddress] = _compilerVersion;  
    }

    /**
     * @dev Read published source code for a contract.
     * @param _publisher User publishing the contract.
     * @param _contractAddress address of the contract of which to retrieve the source code evmfs address.
     */
    function readSource(
      address _publisher,
      address _contractAddress)
    public
    view
    returns (string memory)
    {
      return source[_publisher][_contractAddress];
    }

    /**
     * @dev Read published Ethereum Virtual Machine target version for a contract.
     * @param _publisher User publishing the contract.
     * @param _contractAddress address of the contract of which to retrieve the EVM version it targets.
     */
    function readEvmVersion(
      address _publisher,
      address _contractAddress)
    public
    view
    returns (string memory)
    {
      return evmVersion[_publisher][_contractAddress];
    }

    /**
     * @dev Read published compiler used to build a given contract.
     * @param _publisher User publishing the contract.
     * @param _contractAddress address of the contract of which to retrieve the compiler used to build it.
     */
    function readCompiler(
      address _publisher,
      address _contractAddress)
    public
    view
    returns (string memory)
    {
      return compiler[_publisher][_contractAddress];
    }

    /**
     * @dev Read published compiler version used to build a given contract.
     * @param _publisher User publishing the contract.
     * @param _contractAddress address of the contract of which to retrieve the compiler version used to build it.
     */
    function readCompilerVersion(
      address _publisher,
      address _contractAddress)
    public
    view
    returns (string memory)
    {
      return compilerVersion[_publisher][_contractAddress];
    }
}
