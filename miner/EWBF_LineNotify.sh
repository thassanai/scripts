#!/usr/bin/env bash

# EWBF Linux Line Notify 
# By Thassanai Mhuansean
# Require curl jq screen
# Monitor Rig with LINE Notify
# By Thassanai Mhuansean
# BTC: 15g8qBBBz1j1shx5WQpD9hB2CqzVaDm3MB
#

#Line Token ID
LINE_TOKEN=''
LINE_MINER='Miner01'
EWBF_API="http://127.0.0.1:42000/getstat"

if [ -z "${LINE_TOKEN}" ]; then
    echo "LINE_TOKEN is not set,exit!!"
    exit
fi
LINE_NEWLINE=$'\n'
CEL="C" 
TIME_LOOP=$[NOTIFY_LOOP_MINUTE*60]
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

        echo "$(date) - Starting miner line notify script." 
        EWBF_STAT=$( curl -sS  $EWBF_API )
        GPU_COUNT=$( echo $EWBF_STAT | jq '.result | length')
        LINE_MSG="$LINE_MINER $LINE_NEWLINE"
        GPU_TOTAL=0

        echo "$EWBF_STAT"  | jq -c '.result []' | 
        {
        while read object; 
        do
        #echo "$object" 
                GPU_ID=$(echo "$object" | jq '.gpuid' )
                GPU_NAME=$(echo "$object" | jq '.name' )
                GPU_TEMP=$(echo "$object" | jq '.temperature' )
                GPU_POWER=$(echo "$object" | jq '.gpu_power_usage' )
                GPU_SPEED=$(echo "$object" | jq '.speed_sps' )
                GPU_TOTAL=$[GPU_TOTAL+GPU_SPEED]
                GPU_POWER_TOTAL=$[GPU_POWER_TOTAL+GPU_POWER]
                #Read from nvidia-smi
                { IFS=', ' read CURRENT_TEMP CURRENT_FAN POWERDRAW PWRLIMIT; } < <(nvidia-smi -i $GPU_ID --query-gpu=temperature.gpu,fan.speed,power.draw,power.limit --format=csv,noheader,nounits)

                LINE_MSG+="GPU#$GPU_ID, $GPU_SPEED Sol/s, $GPU_TEMP $CEL, FAN $CURRENT_FAN%, $GPU_POWER W$LINE_NEWLINE"
        #echo "$LINE_MSG"
        done
         LINE_MSG+="Total Speed:$GPU_TOTAL Sol/s$LINE_NEWLINE"
        LINE_MSG+="Total Power:$GPU_POWER_TOTAL W $LINE_NEWLINE"
        echo "$LINE_MSG" 
        curl -sS -X POST https://notify-api.line.me/api/notify \
                -H "Authorization: Bearer $LINE_TOKEN" \
                -F "message=$LINE_MSG" > /tmp/line.log  

        }
