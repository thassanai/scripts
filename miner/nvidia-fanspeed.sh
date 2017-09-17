#!/usr/bin/env bash

#
# nvidia-fanspeed.sh
# Overclocking with nvidia-settings
# By Thassanai Mhuansean
# BTC: 15g8qBBBz1j1shx5WQpD9hB2CqzVaDm3MB
#

declare -i gpuTemp
export DISPLAY=:0

# Graphics card 1 to 6
for MY_DEVICE in {0..5}
do
        # Check if card exists
        if nvidia-smi -i $MY_DEVICE >> /dev/null 2>&1; then
                gpuTemp=$(nvidia-smi -i $MY_DEVICE --format=noheader,csv --query-gpu=temperature.gpu);
                # Set GPU fan speed
                if   [ $gpuTemp -ge 85 ]; then
                        FAN_SPEED='90'
                elif [ $gpuTemp -ge 80 ]; then
                        FAN_SPEED='85'
                elif [ $gpuTemp -ge 70 ]; then
                        FAN_SPEED='80'
                elif [ $gpuTemp -ge 60 ]; then
                        FAN_SPEED='70'
                elif [ $gpuTemp -ge 55 ]; then
                        FAN_SPEED='60'
                elif [ $gpuTemp -ge 50 ]; then
                        FAN_SPEED='50'
                else
                        FAN_SPEED='30'
                fi
                # Set Fan speed
                nvidia-settings -a "[gpu:$MY_DEVICE]/GPUFanControlState=1"
                nvidia-settings -a "[fan:$MY_DEVICE]/GPUTargetFanSpeed=$FAN_SPEED"
        fi
done

echo
echo "Done"
echo