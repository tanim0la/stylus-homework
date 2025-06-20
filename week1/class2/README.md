
## Setup your development environment 

Follow the steps [here](https://docs.arbitrum.io/stylus/quickstart#setting-up-your-development-environment) to set up your development environment.


## Guide to class 2 HOMEWORK (Add owner-only minting logic to your ERC-20 token contract)

This task involves filling in the missing parts of the ERC20 token stylus contracts in `src/lib.rs`.

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
1. `/* 1______ */`

    Goal: Declare a storage variable with the name `owner` of type `address`.

2. `/* 2______ */`

    Goal: Prevent re-initialization by checking if `self.owner` is already set. Replace with the correct condition. If it the owner is already set, return an error.

3. `/* 3______ */`

    Goal: Only the contract owner should be allowed to call `mint()`. If anyone else tries, return an error. Replace with the correct condition.


## Test

1. Rename `.env.example` to `.env` in `./scripts` folder.

2. Run the following command to deploy the contract
    ```
    ./scripts/deploy.sh
    ```
    Upon successful deployment, set the `CONTRACT_ADDRESS` in your `.env` file to the address of the deployed contract.

3. Run the following command to initialize the owner
    ```
    ./scripts/init.sh
    ```

4. Run the following command to run the test script
    ```
    ./scripts/test.sh
    ```