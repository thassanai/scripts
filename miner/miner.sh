#!/usr/bin/env bash

#
# miner.sh
# Start etherminer and set power limit
#

# Load global settings settings.conf
if ! source ~/settings.conf; then
        echo "FAILURE: Can not load global settings 'settings.conf'"
        exit 9
fi

# Set power limit
sudo nvidia-smi -pm ENABLED
sudo nvidia-smi -pl "$MY_WATT"
echo

export GPU_FORCE_64BIT_PTR=0
export GPU_MAX_HEAP_SIZE=100
export GPU_USE_SYNC_OBJECTS=1
export GPU_MAX_ALLOC_PERCENT=100
export GPU_SINGLE_ALLOC_PERCENT=100

# ethminer
# https://github.com/ethereum-mining/ethminer
# Use -G (opencl) or -U (cuda) flag to select GPU platform.
#~/minerscipt/ethereum-mining/ethminer/build/ethminer/ethminer --farm-recheck 200 -U -S "asia1.ethermine.org:4444" -FS "asia1.ethermine.org:4444" -O "$MY_ETH_ADDRESS.$MY_RIG"
#~/ethereum-mining/ethminer/build/ethminer/ethminer --farm-recheck 200 -U -S "eth-asia1.nanopool.org:9999" -FS "eth-asia1.nanopool.org:9999" -O "$MY_ETH_ADDRESS.$MY_RIG" --api-port 4086

# Claymore's Dual Ethereum+Decred AMD+NVIDIA GPU Miner
# https://github.com/nanopool/Claymore-Dual-Miner
#~/minerscript/claymore-dual-miner-v10/ethdcrminer64 -epool eth-asia1.nanopool.org:9999 -ewal "$MY_ETH_ADDRESS.$MY_RIG" -epsw x -mode 1 -ftime 10 -mport -3333
#~/minerscript/claymore-dual-miner-v10/ethdcrminer64 -epool asia1.ethermine.org:4444 -ewal "$MY_ETH_ADDRESS.$MY_RIG" -epsw x -mode 1 -ftime 10 -mport -3333

# ZEC Miner
~/minerscript/zecminer/0.3.4b/miner --server asia1-zcash.flypool.org --user "$MY_ZEC_ADDRESS.$MY_RIG" --pass x --port 3333 --cuda_devices 0 1 2 3 4 5 --solver 0 --tempunits C --templimit 85 --api

# ZEN with zenmine.pro
#~/minerscript/zecminer/0.3.4b/miner --server asia.zenmine.pro --user "$MY_ZEN_ADDRESS.$MY_RIG" --pass x --port 9009 --cuda_devices 0 1 2 3 4 5 --solver 0 --tempunits C --templimit 85 --api
