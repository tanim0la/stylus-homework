// Only run this as a WASM if the export-abi feature is not set.
#![cfg_attr(not(any(feature = "export-abi", test)), no_main)]
extern crate alloc;

// Modules and imports
mod erc20;

use crate::erc20::{Erc20, Erc20Error, Erc20Params};
use alloy_primitives::{Address, U256};
use stylus_sdk::{msg, prelude::*};

/// Immutable definitions
struct RareTokenParams;
impl Erc20Params for RareTokenParams {
    const NAME: &'static str = "RareToken";
    const SYMBOL: &'static str = "RTK";
    const DECIMALS: u8 = 18;
}


// Refer to the README for guide
sol_storage! {
    #[entrypoint]
    struct RareToken {
        /* 1________ */
        #[borrow]
        Erc20<RareTokenParams> erc20;
    }
}

#[public]
#[inherit(Erc20<RareTokenParams>)]
impl RareToken {
    /// Initialize state variables
    pub fn init(&mut self) {
        if /* 2________ */ {
            panic!("Owner Already Initialized.");
        }

        self.owner.set(msg::sender()); // Set the owner
    }

    /// Mints 15 tokens to msg.sender
    pub fn mint(&mut self) {
        if /* 3________ */ {
            panic!("Caller Not Owner");
        }

        let _ = self.erc20.mint(msg::sender(), U256::from(15));
    }
}
