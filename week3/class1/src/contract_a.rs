use alloc::vec::Vec;
use stylus_sdk::{alloy_primitives::U256, prelude::*};

sol_storage! {
    pub struct ContractA {}
}

#[public]
impl ContractA {
    pub fn ret_num() -> U256 {
        U256::from(8)
    }
}
