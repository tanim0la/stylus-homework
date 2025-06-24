## Setup your development environment 

Follow the steps [here](https://docs.arbitrum.io/stylus/quickstart#setting-up-your-development-environment) to set up your development environment.


## Guide to WEEK2 HOMEWORK 1

This task involves filling in the missing parts of the stylus contracts in `push-based-distributor/src/lib.rs`.

Example:
```rust
// Get count from a different contract
let count = match /* 1. _______ */ {
    Ok(value) => value,
    Err(_) => return Err(Error::NoCount(NoCount {})),
};
```

Solution:
```rust
let count = match diff_contract.getCount(&mut *self) {
    Ok(value) => value,
    Err(_) => return Err(Error::NoCount(NoCount {})),
};
```

### push-based-distributor
1. `/* 1______ */` (line 12)

    Hint: This should be the name of the module for inspecting the contract itself (to get the contract address itself).

2. `/* 2______ */` (line 36)

    Hint: Replace with the macro that allows us to declare Solidity-like errors or events.

3. `/* 3______ */` (line 44)

    Hint: Match the `InsufficientBalance` variant to its custom error.

4. `/* 4______ */` (line 52)

    Hint: Wrap the `_token` address around `IERC20` interface.

5. `/* 5______ */` (line 59)

    Hint: Replace with the `InsufficientBalance` custom error.

6. `/* 6______ */` (line 71)

    Hint: Make a cross-contract call to transfer tokens to the caller.


## Test
Run the following command
```
cargo stylus check
```

if no error then the contract is valid.