#!/bin/bash

# Load variables from .env file
set -o allexport
source scripts/.env
set +o allexport

# Check for variables
if [ -z "$CONTRACT_ADDRESS" ] 
then
    echo "CONTRACT_ADDRESS is not set"
    echo "You can run the script by setting the variables at the beginning: CONTRACT_ADDRESS=0x "
    exit 0
fi

# Initialize owner
cast send --rpc-url $RPC_URL --private-key $PRIVATE_KEY $CONTRACT_ADDRESS "init()"
