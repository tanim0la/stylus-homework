#!/bin/bash

# Load variables from .env file
set -o allexport
source scripts/.env
set +o allexport

# -------------- #
# Initial checks #
# -------------- #
if [ -z "$RECEIVER_ADDRESS" ] || [ -z "$RECEIVER_PRIVATE_KEY" ]
then
    echo "RECEIVER_ADDRESS or RECEIVER_PRIVATE_KEY is not set. Set them in the .env file"
    exit 0
fi

if [ -z "$CONTRACT_ADDRESS" ]
then
    echo "CONTRACT_ADDRESS is not set"
    echo "You can run the script by setting the variables at the beginning: CONTRACT_ADDRESS=0x test.sh"
    exit 0
fi

echo "Testing contract deployed at $CONTRACT_ADDRESS"

# Send eth to receiver address
cast send --private-key $PRIVATE_KEY --rpc-url $RPC_URL $RECEIVER_ADDRESS --value 1ether

# Initial balances
initial_balance=$(cast call --rpc-url $RPC_URL $CONTRACT_ADDRESS "balanceOf(address) (uint256)" $ADDRESS)
echo "Initial balance of $ADDRESS: $initial_balance"
initial_receiver_balance=$(cast call --rpc-url $RPC_URL $CONTRACT_ADDRESS "balanceOf(address) (uint256)" $RECEIVER_ADDRESS)
echo "Initial balance of $RECEIVER_ADDRESS: $initial_receiver_balance"

# Initial supply
initial_total_supply=$(cast call --rpc-url $RPC_URL $CONTRACT_ADDRESS "totalSupply() (uint256)")
echo "Initial supply: $initial_total_supply"


# ------------
# Minting test
# ------------
echo ""
echo "************"
echo "Minting test"
echo "************"

echo "Minting 15 tokens"
cast send --rpc-url $RPC_URL --private-key $PRIVATE_KEY $CONTRACT_ADDRESS "mint()"

echo "Minting 10 tokens to $RECEIVER_ADDRESS"
cast send --rpc-url $RPC_URL --private-key $PRIVATE_KEY $CONTRACT_ADDRESS "mintTo(address,uint256) ()" $RECEIVER_ADDRESS 10

# Check balances
balance_after_mint=$(cast call --rpc-url $RPC_URL $CONTRACT_ADDRESS "balanceOf(address) (uint256)" $ADDRESS)
echo "New balance of $ADDRESS: $balance_after_mint"
expected_balance=$((initial_balance + 15))
if [ "$balance_after_mint" -ne "$expected_balance" ]; then
    echo "New balance ($balance_after_mint) is not the expected balance ($expected_balance)"
    exit 1
fi

receiver_balance_after_mint=$(cast call --rpc-url $RPC_URL $CONTRACT_ADDRESS "balanceOf(address) (uint256)" $RECEIVER_ADDRESS)
echo "New balance of $RECEIVER_ADDRESS: $receiver_balance_after_mint"
expected_receiver_balance=$((initial_receiver_balance + 10))
if [ "$receiver_balance_after_mint" -ne "$expected_receiver_balance" ]; then
    echo "New balance ($receiver_balance_after_mint) is not the expected balance ($expected_receiver_balance)"
    exit 1
fi

# Check total supply
total_supply_after_mint=$(cast call --rpc-url $RPC_URL $CONTRACT_ADDRESS "totalSupply() (uint256)")
echo "New total supply: $total_supply_after_mint"
expected_total_supply=$((initial_total_supply + 15 + 10))
if [ "$total_supply_after_mint" -ne "$expected_total_supply" ]; then
    echo "New total supply ($total_supply_after_mint) is not the expected total supply ($expected_total_supply)"
    exit 1
fi


