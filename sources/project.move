module MyModule::TokenRebalancingPool {
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    /// Struct representing a rebalancing pool
    struct Pool has store, key {
        total_tokens: u64,    // Total tokens in the pool
        target_ratio: u64,    // Target ratio for rebalancing (in percentage, 0-100)
    }

    /// Creates a new rebalancing pool with a target ratio
    public entry fun create_pool(owner: &signer, target_ratio: u64) {
        // Ensure target ratio is between 0 and 100
        assert!(target_ratio <= 100, 1001);
        
        let pool = Pool {
            total_tokens: 0,
            target_ratio
        };
        move_to(owner, pool);
    }

    /// Allows users to add tokens and rebalance the pool
    public entry fun add_and_rebalance(
        user: &signer, 
        pool_owner: address, 
        amount: u64
    ) acquires Pool {
        let pool = borrow_global_mut<Pool>(pool_owner);
        
        // Transfer tokens from user to pool owner
        let tokens = coin::withdraw<AptosCoin>(user, amount);
        coin::deposit<AptosCoin>(pool_owner, tokens);
        
        // Update total tokens
        pool.total_tokens = pool.total_tokens + amount;
        
        // Simple rebalancing logic: if above target ratio, adjust total
        let current_ratio = (pool.total_tokens * 100) / amount;
        if (current_ratio > pool.target_ratio) {
            let excess = pool.total_tokens - ((pool.target_ratio * amount) / 100);
            pool.total_tokens = pool.total_tokens - excess;
        }
    }
} 