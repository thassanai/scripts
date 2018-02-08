#!/usr/bin/env bash

export DISPLAY=:0

sudo nvidia-smi -pm 1

sudo nvidia-smi -i 0 -pl 90
# GPU:0 GTX1060 6G RAM: SS
nvidia-settings -a "[gpu:0]/GPUFanControlState=1"
nvidia-settings -a "[gpu:0]/GPUPowerMizerMode=1"
# Graphics clock
nvidia-settings -a "[gpu:0]/GPUGraphicsClockOffset[3]=150"
# Memory clock
nvidia-settings -a "[gpu:0]/GPUMemoryTransferRateOffset[3]=450"

# GPU:1 GTX1060 6G RAM: SS
sudo nvidia-smi -i 1 -pl 85
nvidia-settings -a "[gpu:1]/GPUFanControlState=1"
nvidia-settings -a "[gpu:1]/GPUPowerMizerMode=1"
# Graphics clock
nvidia-settings -a "[gpu:1]/GPUGraphicsClockOffset[3]=-50"
# Memory clock
nvidia-settings -a "[gpu:1]/GPUMemoryTransferRateOffset[3]=1050"

# GPU:2 GTX1060 6G RAM: HYN
sudo nvidia-smi -i 2 -pl 85
nvidia-settings -a "[gpu:2]/GPUFanControlState=1"
nvidia-settings -a "[gpu:2]/GPUPowerMizerMode=1"
# Graphics clock
nvidia-settings -a "[gpu:2]/GPUGraphicsClockOffset[3]=150"
# Memory clock
nvidia-settings -a "[gpu:2]/GPUMemoryTransferRateOffset[3]=450"

# GPU:3 GTX1050Ti 4G RAM: HN
sudo nvidia-smi -i 3 -pl 75
nvidia-settings -a "[gpu:3]/GPUFanControlState=1"
nvidia-settings -a "[gpu:3]/GPUPowerMizerMode=1"
# Graphics clock
nvidia-settings -a "[gpu:3]/GPUGraphicsClockOffset[2]=-100"
# Memory clock
nvidia-settings -a "[gpu:3]/GPUMemoryTransferRateOffset[2]=1900"

# GPU:4 GTX1050Ti 4G RAM: SS
sudo nvidia-smi -i 4 -pl 75
nvidia-settings -a "[gpu:4]/GPUFanControlState=1"
nvidia-settings -a "[gpu:4]/GPUPowerMizerMode=1"
# Graphics clock
#nvidia-settings -a "[gpu:4]/GPUGraphicsClockOffset[2]=-100"
# Memory clock
#nvidia-settings -a "[gpu:4]/GPUMemoryTransferRateOffset[2]=1900"

# GPU:5 GTX1060 6G RAM: SS
sudo nvidia-smi -i 5 -pl 85
nvidia-settings -a "[gpu:5]/GPUFanControlState=1"
nvidia-settings -a "[gpu:5]/GPUPowerMizerMode=1"
# Graphics clock
nvidia-settings -a "[gpu:5]/GPUGraphicsClockOffset[3]=-50"
# Memory clock
nvidia-settings -a "[gpu:5]/GPUMemoryTransferRateOffset[3]=1050"

# GPU:6 GTX1060 6G RAM: HYN
sudo nvidia-smi -i 6 -pl 100
nvidia-settings -a "[gpu:6]/GPUFanControlState=1"
nvidia-settings -a "[gpu:6]/GPUPowerMizerMode=1"
# Graphics clock
nvidia-settings -a "[gpu:6]/GPUGraphicsClockOffset[3]=150"
# Memory clock
nvidia-settings -a "[gpu:6]/GPUMemoryTransferRateOffset[3]=450"

# GPU:7 GTX1060 6G RAM: HYN
sudo nvidia-smi -i 7 -pl 100
nvidia-settings -a "[gpu:7]/GPUFanControlState=1"
nvidia-settings -a "[gpu:7]/GPUPowerMizerMode=1"
# Graphics clock
nvidia-settings -a "[gpu:7]/GPUGraphicsClockOffset[3]=150"
# Memory clock
nvidia-settings -a "[gpu:7]/GPUMemoryTransferRateOffset[3]=450"

# GPU:8 GTX1070Ti 8G RAM: HYN
sudo nvidia-smi -i 8 -pl 110
nvidia-settings -a "[gpu:8]/GPUFanControlState=1"
nvidia-settings -a "[gpu:8]/GPUPowerMizerMode=1"
# Graphics clock
nvidia-settings -a "[gpu:8]/GPUGraphicsClockOffset[3]=100"
# Memory clock
nvidia-settings -a "[gpu:8]/GPUMemoryTransferRateOffset[3]=1300"

# GPU:9 GTX1060 6G RAM: SS
sudo nvidia-smi -i 9 -pl 100
nvidia-settings -a "[gpu:9]/GPUFanControlState=1"
nvidia-settings -a "[gpu:9]/GPUPowerMizerMode=1"
# Graphics clock
nvidia-settings -a "[gpu:9]/GPUGraphicsClockOffset[3]=-50"
# Memory clock
nvidia-settings -a "[gpu:9]/GPUMemoryTransferRateOffset[3]=1050"

# GPU:10 GTX1060 6G RAM: HYN
sudo nvidia-smi -i 10 -pl 90
nvidia-settings -a "[gpu:10]/GPUFanControlState=1"
nvidia-settings -a "[gpu:10]/GPUPowerMizerMode=1"
# Graphics clock
nvidia-settings -a "[gpu:10]/GPUGraphicsClockOffset[3]=150"
# Memory clock
nvidia-settings -a "[gpu:10]/GPUMemoryTransferRateOffset[3]=450"

# GPU:11 GTX1070Ti 8G RAM: HYN
sudo nvidia-smi -i 11 -pl 110
nvidia-settings -a "[gpu:11]/GPUFanControlState=1"
nvidia-settings -a "[gpu:11]/GPUPowerMizerMode=1"
# Graphics clock
nvidia-settings -a "[gpu:11]/GPUGraphicsClockOffset[3]=100"
# Memory clock
nvidia-settings -a "[gpu:11]/GPUMemoryTransferRateOffset[3]=1300"
