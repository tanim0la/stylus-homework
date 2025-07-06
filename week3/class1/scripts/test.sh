#!/bin/bash

# Load variables from .env file
set -o allexport
source scripts/.env
set +o allexport

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# -------------- #
# Initial checks #
# -------------- #
if [ -z "$CONTRACT_ADDRESS" ]
then
    echo "CONTRACT_ADDRESS is not set"
    echo "You can run the script by setting the variables at the beginning: CONTRACT_ADDRESS=0x test.sh"
    exit 0
fi


# ------------
# test test
# ------------
echo ""
echo "************"
echo "retNum test"
echo "************"
 
num=$(cast call --rpc-url $RPC_URL $CONTRACT_ADDRESS "retNum() (uint256)")
expected_num=$((4))
if [ "$num" -eq "$expected_num" ]; then
    echo -e "${GREEN}Function override passed.${NC}"
else
    echo -e "${RED}Function override failed. Called ret_num() in contract_b.${NC}"

fi

echo ""
echo "************"
echo "foofoo test"
echo "************"
 
num=$(cast call --rpc-url $RPC_URL $CONTRACT_ADDRESS "foofoo() (uint256)")
expected_num=$((8))
if [ "$num" -eq "$expected_num" ]; then
    echo -e "${GREEN}Function override passed.${NC}"
else
    echo -e "${RED}Function override failed. Called ret_num() in contract_a.${NC}"

fi