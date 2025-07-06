
## Setup your development environment 

Follow the steps [here](https://docs.arbitrum.io/stylus/quickstart#setting-up-your-development-environment) to set up your development environment.


## Guide to week 3 class 1 HOMEWORK (Inheritance)

This task involves filling in the missing parts of the contract in `src/lib.rs`.

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

    Hint: Replace with the borrow annotation.

2. `/* 2. ______ */`

    Hint: Inherit from the contracts in the order, `contract_b` first, then `contract_a`.

3. `/* 3. ______ */`

    Hint: Within the `foofoo` function, call the `ret_num()` function defined in `contract_a`, and return its value. Using the path separator like so: `<contarct_name>::<function_name>`


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