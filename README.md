# Dynamic Token Rebalancing Pools

This is a simple Move smart contract for the Aptos blockchain that implements a basic dynamic token rebalancing pool system.

## Overview

The contract provides functionality to create and manage token pools that automatically rebalance based on a target ratio. It uses AptosCoin as the native token and maintains a simple rebalancing mechanism.

## Features

- Create rebalancing pools with a specified target ratio (0-100%)
- Add tokens to pools with automatic rebalancing
- Basic token tracking and management

## Contract Structure

### Module
- **Module Name**: `MyModule::TokenRebalancingPool`

### Structs
- `Pool`: Stores pool data
  - `total_tokens`: Total amount of tokens in the pool (u64)
  - `target_ratio`: Target ratio for rebalancing (u64, 0-100)

### Functions
1. `create_pool(owner: &signer, target_ratio: u64)`
   - Creates a new rebalancing pool
   - Validates target ratio (must be ≤ 100)
   - Initializes pool with zero tokens

2. `add_and_rebalance(user: &signer, pool_owner: address, amount: u64)`
   - Adds tokens to the pool
   - Transfers AptosCoin from user to pool owner
   - Rebalances pool if current ratio exceeds target
   - Updates total token amount

## Dependencies
- `aptos_framework::coin`
- `aptos_framework::aptos_coin::AptosCoin`

## Installation

1. Ensure you have the Aptos CLI installed
2. Place the contract in your Move project sources directory
3. Compile with:
```bash
aptos move compile