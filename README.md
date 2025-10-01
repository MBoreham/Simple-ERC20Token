# 🪙 Simple-ERC20Token

A foundational and secure implementation of the ERC20 standard for EVM-compatible blockchains.

![Version](https://img.shields.io/badge/version-1.0.0-blue) ![License](https://img.shields.io/badge/license-None-lightgrey) ![Stars](https://img.shields.io/github/stars/MBoreham/Simple-ERC20Token?style=social) ![Forks](https://img.shields.io/github/forks/MBoreham/Simple-ERC20Token?style=social) ![Top Language](https://img.shields.io/github/languages/top/MBoreham/Simple-ERC20Token?color=orange)


---


## ✨ Features

This project provides a robust and straightforward implementation of the ERC20 token standard, designed for clarity, security, and ease of use.

*   **✨ ERC20 Standard Compliance:** Fully adheres to the ERC20 token standard, ensuring broad compatibility across wallets, exchanges, and decentralized applications (dApps).
*   **🛡️ Security-Focused Design:** Developed with best practices in Solidity to minimize common vulnerabilities and ensure the integrity and safety of token operations.
*   **🧪 Robust Testing with Foundry:** Includes a comprehensive test suite built using the Foundry development framework, providing high confidence in the token's functionality and reliability.
*   **🚀 Simple & Extensible:** A clean, minimal codebase that is easy to understand, audit, and extend for future functionalities or custom tokenomics.

  OpenZepplin Contracts

  A library for secure smart contract development. Build on a solid foundation of community-vetted code.

Implementations of standards like ERC20 and ERC721.
Flexible role-based permissioning scheme.
Reusable Solidity components to build custom contracts and complex decentralized systems.
🧙 Not sure how to get started? Check out Contracts Wizard — an interactive smart contract generator.

Important

OpenZeppelin Contracts uses semantic versioning to communicate backwards compatibility of its API and storage layout. For upgradeable contracts, the storage layout of different major versions should be assumed incompatible, for example, it is unsafe to upgrade from 4.9.3 to 5.0.0. Learn more at Backwards Compatibility.

---


## 🛠️ Installation Guide


### Manual Installation Steps

1.  **Clone the Repository:**
    Start by cloning the `Simple-ERC20Token` repository to your local machine:

    ```bash
    git clone https://github.com/MBoreham/Simple-ERC20Token.git
    cd Simple-ERC20Token
    ```

2.  **Install Dependencies:**
    This project uses Foundry's package manager `forge` to manage its dependencies.

    ```bash
    forge update
    # Or, if starting fresh:
    # forge install
    ```

3.  **Build the Project:**
    Compile the smart contracts using `forge build`:

    ```bash
    forge build
    ```

4.  **Run Tests:**
    Execute the test suite to ensure everything is working correctly:

    ```bash
    forge test
    ```

---


## 🚀 Usage Examples

Once installed, you can interact with the `Simple-ERC20Token` smart contract. Here are some basic usage examples for deploying and interacting with your token.

### Deploying the Token

You can deploy the token to a local Anvil instance or any EVM-compatible network using `forge script`.

1.  **Start a local Anvil instance (if not already running):**

    ```bash
    anvil
    ```

2.  **Deploy the token using a Foundry script:**
    (Assuming you have a deployment script, e.g., `script/DeployToken.s.sol`)

    ```bash
    forge script script/DeployToken.s.sol:DeployToken --rpc-url http://127.0.0.1:8545 --private-key <YOUR_PRIVATE_KEY> --broadcast
    ```

    Replace `<YOUR_PRIVATE_KEY>` with a private key that has funds on your target network. For a local Anvil instance, you can use one of the default private keys provided by `anvil`.

### Interacting with the Deployed Token

After deployment, you can interact with your token using `cast`, Foundry's CLI tool for EVM interactions.

Let's assume your deployed token's address is `0x...TOKEN_ADDRESS...`.

1.  **Check the Token Name:**

    ```bash
    cast call 0x...TOKEN_ADDRESS... "name()(string)" --rpc-url http://127.0.0.1:8545
    ```

2.  **Check the Token Symbol:**

    ```bash
    cast call 0x...TOKEN_ADDRESS... "symbol()(string)" --rpc-url http://127.0.0.1:8545
    ```

3.  **Get Total Supply:**

    ```bash
    cast call 0x...TOKEN_ADDRESS... "totalSupply()(uint256)" --rpc-url http://127.0.0.1:8545
    ```

4.  **Check an Account's Balance:**
    Replace `0x...ACCOUNT_ADDRESS...` with the address you want to check.

    ```bash
    cast call 0x...TOKEN_ADDRESS... "balanceOf(address)(uint256)" 0x...ACCOUNT_ADDRESS... --rpc-url http://127.0.0.1:8545
    ```

5.  **Transfer Tokens (Requires a funded private key

## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
