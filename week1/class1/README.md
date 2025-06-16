
## Setup your development environment 

Follow the steps [here](https://docs.arbitrum.io/stylus/quickstart#setting-up-your-development-environment) to set up your development environment.


## Guide to class 1 HOMEWORK (Implement your own ERC-20 token contract using Stylus)

This task involves filling in the missing parts of the ERC20 token stylus contracts in `src/lib.rs` and `src/erc20.rs` .

Example:
```rust
pub fn my_func(&mut self, addy: /* 1______ */) {
    // Logic...
}
```

Solution:
```rust
pub fn my_func(&mut self, addy: Address) {
    // Logic...
}
```

### Guide
1. `/* 1. ______ */`

    Goal: This should be the name of the struct that represents the token contract. Remember, it is referenced in the `impl` block.

2. `/* 2. ______ */`

    Goal: Make the contract functions public. Replace with the `public` visibility annotation.

3. `/* 3. ______ */`

    Goal: Navigate to `src/erc20.rs` on line 89, the `mint` function is private. Replace with the correct keyword to make the function accessible outside the module.

4. `/* 4. ______ */`

    Goal: The `value` parameter represents the amount of tokens to mint. Replace with the correct value type (`uint256` equivalence in Rust).


## Test

1. Rename `.env.example` to `.env` in `./scripts` folder.

2. Run the following command to deploy the contract
    ```
    ./scripts/deploy.sh
    ```
    Upon successful deployment, set the `CONTRACT_ADDRESS` in your `.env` file to the address of the deployed contract.

3. Run the following command to run the test script
    ```
    ./scripts/test.sh
    ```