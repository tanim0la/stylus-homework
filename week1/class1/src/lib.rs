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
    pub struct RareToken{
        #[borrow]
        Erc20<RareTokenParams> erc20;
    }
}

// Refer to the README for guide
sol_storage! {
    #[entrypoint]
    pub struct /* 1. ______ */ {
        #[borrow]
        Erc20<RareTokenParams> erc20;
    }
}

#[/* 2. ______ */]
#[inherit(Erc20<RareTokenParams>)]
impl RareToken {
    /// Mints tokens
    pub fn mint(&mut self) -> Result<(), Erc20Error> {
        self.erc20.mint(msg::sender() , U256::from(15))?;
        Ok(())
    }

    /// Mints tokens to another address
    pub fn mint_to(&mut self, to: Address, value: /* 4. ______ */ ) -> Result<(), Erc20Error> {
        self.erc20.mint(to, value)?;
        Ok(())
    }
}
