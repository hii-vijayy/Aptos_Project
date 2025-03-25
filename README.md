# MultiSigWallet - Aptos Move Smart Contract

A lightweight multi-signature wallet implementation in Move for DeFi platforms on the Aptos blockchain. This contract enables secure, multi-party transaction approvals with a minimal footprint.

## Overview

This smart contract provides a basic multi-signature wallet with two key functions:
1. **Create a Wallet**: Initialize a wallet with multiple owners and a specified number of required approvals.
2. **Execute Transactions**: Transfer `AptosCoin` to a recipient once sufficient owner approvals are simulated.

Designed to stay within 40-50 lines, this serves as a starting point for DeFi applications requiring multi-signature security.

## Vision

The vision of MultiSigWallet is to provide a foundational tool for secure, decentralized fund management in DeFi. By requiring multiple approvals for transactions, it aims to mitigate risks of centralized control or single-point failures, fostering trust and collaboration among stakeholders on the Aptos blockchain.

## Future Scope

The current implementation is a minimal prototype with room for growth:
- **Robust Approvals**: Implement full tracking of individual owner votes.
- **Enhanced Security**: Add timelocks, transaction cancellation, and multi-token support.
- **Scalability**: Integrate with DeFi protocols for broader use cases like governance or staking.
- **User Experience**: Build a frontend interface for seamless interaction.
- **Real-World Deployment**: Harden the contract with audits and comprehensive testing.

## Contract Details

- **Module**: `DeFiPlatform::MultiSigWallet`
- **Language**: Move
- **Blockchain**: Aptos
- **Dependencies**: 
  - `aptos_framework::signer`
  - `aptos_framework::coin`
  - `aptos_framework::aptos_coin`

## Features
- **Multi-Owner Support**: Define a list of owners during wallet creation.
- **Approval Threshold**: Specify how many approvals are needed for a transaction.
- **Simple Execution**: Transfers funds once conditions are met (simplified for this example).

## Limitations
- **Simplified Approvals**: Does not fully track individual owner approvals due to line constraints.
- **Basic Security**: Lacks advanced features like timelocks, revocation, or multi-step verification.
- **Not Production-Ready**: Intended as a minimal demo; additional logic is needed for real-world use.

## Prerequisites
- [Aptos CLI](https://aptos.dev/tools/aptos-cli/install) installed.
- An Aptos wallet with testnet/devnet funds.
- Basic familiarity with Move and Aptos blockchain.

## Setup & Deployment

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/multisig-wallet-aptos.git
   cd multisig-wallet-aptos