
## Setup your development environment 

Follow the steps [here](https://docs.arbitrum.io/stylus/quickstart#setting-up-your-development-environment) to set up your development environment.


## Guide to week2 class2 HOMEWORK 

This task involves filling in the missing parts of the contract with the correct method or global variable name in `src/lib.rs`.

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
Refer to the [guide here](https://fixed-order-988.notion.site/Global-vars-in-Stylus-21fd8a696c26806dad46d9a7c3be1012) for available methods.


1.  `/* 1. ______ */`

    Hint: Set the caller as the contract's owner.

2.  `/* 2. ______ */`

    Hint: Return the amount of ETH sent with the current call.

3.  `/* 3. ______ */`

    Hint: Store the current contract's address in a variable named this_contract.

4.  `/* 4. ______ */`

    Hint: Return the ETH balance of the address stored in this_contract.

5.  `/* 5. ______ */`

    Hint: Return the original sender of the transaction (not just the immediate caller).

6.  `/* 6. ______ */`

    Hint: Convert a gas value (passed as argument) into its ink representation.

7.  `/* 7. ______ */`

    Hint: Emit the EmitMe event declared earlier in the sol! macro.

8.  `/* 8. ______ */`

    Hint: Return the keccak256 hash of the preimage passed as an argument.



## Test
Run the following command
```
cargo stylus check
```

if no error then the contract is valid.