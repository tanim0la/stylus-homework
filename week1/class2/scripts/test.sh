#!/bin/bash

# Load variables from .env file
set -o allexport
source scripts/.env
set +o allexport

# -------------- #
# Initial checks #
# -------------- #
if [ -z "$CONTRACT_ADDRESS" ]
then
    echo "CONTRACT_ADDRESS is not set"
    echo "You can run the script by setting the variables at the beginning: CONTRACT_ADDRESS=0x test.sh"
    exit 0
fi

ADDRESS=$(cast wallet address $PRIVATE_KEY)

echo "Testing contract deployed at $CONTRACT_ADDRESS"


# Initial balances
initial_balance=$(cast call --rpc-url $RPC_URL $CONTRACT_ADDRESS "balanceOf(address) (uint256)" $ADDRESS)
echo "Initial balance of $ADDRESS: $initial_balance"

# Initial supply
initial_total_supply=$(cast call --rpc-url $RPC_URL $CONTRACT_ADDRESS "totalSupply() (uint256)")
echo "Initial supply: $initial_total_supply"


# ------------
# Only Owner Minting test
# ------------
echo ""
echo "************"
echo "Only Owner Minting test"
echo "************"

echo "Minting 15 tokens"
cast send --rpc-url $RPC_URL --private-key $PRIVATE_KEY $CONTRACT_ADDRESS "mint()"


# Check balances
balance_after_mint=$(cast call --rpc-url $RPC_URL $CONTRACT_ADDRESS "balanceOf(address) (uint256)" $ADDRESS)
echo "New balance of $ADDRESS: $balance_after_mint"
expected_balance=$((initial_balance + 15))
if [ "$balance_after_mint" -ne "$expected_balance" ]; then
    echo "New balance ($balance_after_mint) is not the expected balance ($expected_balance)"
    exit 1
fi


# Check total supply
total_supply_after_mint=$(cast call --rpc-url $RPC_URL $CONTRACT_ADDRESS "totalSupply() (uint256)")
echo "New total supply: $total_supply_after_mint"
expected_total_supply=$((initial_total_supply + 15))
if [ "$total_supply_after_mint" -ne "$expected_total_supply" ]; then
    echo "New total supply ($total_supply_after_mint) is not the expected total supply ($expected_total_supply)"
    exit 1
fi


