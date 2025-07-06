#![cfg_attr(not(any(test, feature = "export-abi")), no_main)]
#![cfg_attr(not(any(test, feature = "export-abi")), no_std)]

#[macro_use]
extern crate alloc;

use alloc::vec::Vec;

// Modules
mod contract_a;
mod contract_b;

// Import contract from module
use crate::contract_a::ContractA;
use crate::contract_b::ContractB;

/// Import items from the SDK. The prelude contains common traits and macros.
use stylus_sdk::{alloy_primitives::U256, prelude::*};

sol_storage! {
    #[entrypoint]
    pub struct Foo {
        #[borrow]
        ContractA contract_a;

        /* 1. ________ */
        ContractB contract_b;
    }
}

/// Declare that `Foo` is a contract with the following external methods.
#[public]
#[inherit(/* 2. ________ */)]
impl Foo {
    pub fn foofoo() -> U256 {
        /* 3. ________ */
    }
}
