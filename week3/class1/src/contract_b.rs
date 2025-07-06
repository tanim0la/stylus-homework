use alloc::vec::Vec;
use stylus_sdk::{alloy_primitives::U256, prelude::*};

sol_storage! {
    pub struct ContractB {}
}

#[public]
impl ContractB {
    pub fn ret_num() -> U256 {
        U256::from(4)
    }
}
