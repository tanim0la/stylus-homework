#![cfg_attr(not(any(test, feature = "export-abi")), no_main)]
#![cfg_attr(not(any(test, feature = "export-abi")), no_std)]

#[macro_use]
extern crate alloc;

use alloc::vec::Vec;

/// Import items from the SDK. The prelude contains common traits and macros.
use stylus_sdk::{
    alloy_primitives::{Address, FixedBytes, U256},
    alloy_sol_types::sol,
    prelude::*,
};

sol_storage! {
    #[entrypoint]
    pub struct GlobVars {
        address owner;
    }
}

sol! {
    event EmitMe();
}

/// Declare that `GlobVars` is a contract with the following external methods.
#[public]
impl GlobVars {
    #[constructor]
    pub fn constructor(&mut self) {
        self.owner.set(/* 1. _______ */);
    }

    /// Adds the wei value from msg _value to the number in storage.
    #[payable]
    pub fn receive_funds(&self) -> U256 {
        /* 2. _______ */
    }

    pub fn get_balance(&self) -> U256 {
        let this_contract = /* 3. _______ */;

        /* 4. _______ */
    }

    pub fn get_origin(&self) -> Address {
        /* 5. _______ */
    }

    pub fn get_ink(&self, gas: U256) -> U256 {
        let gas_u64 = gas.to::<u64>();

        U256::from(/* 6. _______ */)
    }

    pub fn emit_event(&self) {
        /* 7. _______ */;
    }

    pub fn keccek_hash(&self, preimage: U256) -> FixedBytes<32> {
        self.vm().native_keccak256(/* 8. _______ */)
    }
}
