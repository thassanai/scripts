#!/usr/bin/env bash

#
# linenotify.sh
# Monitor Rig with LINE Notify
# By Thassanai Mhuansean
# BTC: 15g8qBBBz1j1shx5WQpD9hB2CqzVaDm3MB
#

linetoken='generate LINE token on notify-bot.line.me'

# Graphics card 1 to 6
for MY_DEVICE in {0..5}
do
        # Check if card exists
        if nvidia-smi -i $MY_DEVICE >> /dev/null 2>&1; then
                strTemp+="GPU$MY_DEVICE :"$(nvidia-smi -i $MY_DEVICE --format=noheader,csv --query-gpu='temperature.gpu,fan.speed,power.draw')" ";
        fi
done

# Send line notify
curl -X POST -H "Authorization: Bearer $linetoken" -F "message=$strTemp" https://notify-api.line.me/api/notify 

echo
echo "Done"
echo