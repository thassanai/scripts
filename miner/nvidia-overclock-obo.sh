#!/usr/bin/env bash

export DISPLAY=:0

sudo nvidia-smi -i 0 -pm 0
sudo nvidia-smi -i 0 -pl 110
# GPU:0 GTX1060 6G RAM: SS
nvidia-settings -a "[gpu:0]/GPUPowerMizerMode=1"
# Graphics clock
nvidia-settings -a "[gpu:0]/GPUGraphicsClockOffset[3]=150"
# Memory clock
nvidia-settings -a "[gpu:0]/GPUMemoryTransferRateOffset[3]=450"

# GPU:1 GTX1060 6G RAM: SS
sudo nvidia-smi -i 1 -pm 0
sudo nvidia-smi -i 1 -pl 110
nvidia-settings -a "[gpu:1]/GPUPowerMizerMode=1"
# Graphics clock
nvidia-settings -a "[gpu:1]/GPUGraphicsClockOffset[3]=150"
# Memory clock
nvidia-settings -a "[gpu:1]/GPUMemoryTransferRateOffset[3]=450"

# GPU:2 GTX1060 6G RAM: HYN
sudo nvidia-smi -i 2 -pm 0
sudo nvidia-smi -i 2 -pl 110
nvidia-settings -a "[gpu:2]/GPUPowerMizerMode=1"
# Graphics clock
nvidia-settings -a "[gpu:2]/GPUGraphicsClockOffset[3]=150"
# Memory clock
nvidia-settings -a "[gpu:2]/GPUMemoryTransferRateOffset[3]=450"

# GPU:3 GTX1050Ti 4G RAM: SS
sudo nvidia-smi -i 3 -pm 0
sudo nvidia-smi -i 3 -pl 75
nvidia-settings -a "[gpu:3]/GPUPowerMizerMode=1"
# Graphics clock
nvidia-settings -a "[gpu:3]/GPUGraphicsClockOffset[2]=150"
# Memory clock
nvidia-settings -a "[gpu:3]/GPUMemoryTransferRateOffset[2]=900"

# GPU:4 GTX1060 6G RAM: HYN
sudo nvidia-smi -i 4 -pm 0
sudo nvidia-smi -i 4 -pl 110
nvidia-settings -a "[gpu:4]/GPUPowerMizerMode=1"
# Graphics clock
nvidia-settings -a "[gpu:4]/GPUGraphicsClockOffset[3]=150"
# Memory clock
nvidia-settings -a "[gpu:4]/GPUMemoryTransferRateOffset[3]=450"

# GPU:5 GTX1070Ti 8G RAM: HYN
sudo nvidia-smi -i 5 -pm 0
sudo nvidia-smi -i 5 -pl 120
nvidia-settings -a "[gpu:5]/GPUPowerMizerMode=1"
# Graphics clock
nvidia-settings -a "[gpu:5]/GPUGraphicsClockOffset[3]=150"
# Memory clock
nvidia-settings -a "[gpu:5]/GPUMemoryTransferRateOffset[3]=450"

# GPU:6 GTX1060 6G RAM: SS
sudo nvidia-smi -i 6 -pm 0
sudo nvidia-smi -i 6 -pl 110
nvidia-settings -a "[gpu:6]/GPUPowerMizerMode=1"
# Graphics clock
nvidia-settings -a "[gpu:6]/GPUGraphicsClockOffset[3]=150"
# Memory clock
nvidia-settings -a "[gpu:6]/GPUMemoryTransferRateOffset[3]=450"

# GPU:7 GTX1060 6G RAM: HYN
sudo nvidia-smi -i 7 -pm 0
sudo nvidia-smi -i 7 -pl 110
nvidia-settings -a "[gpu:7]/GPUPowerMizerMode=1"
# Graphics clock
nvidia-settings -a "[gpu:7]/GPUGraphicsClockOffset[3]=150"
# Memory clock
nvidia-settings -a "[gpu:7]/GPUMemoryTransferRateOffset[3]=450"
