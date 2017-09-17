#!/usr/bin/env bash

# CCMiner Linux Line Notify 

LINE_TOKEN=''
LINE_MINER='Miner01'
MINER_API="localhost 4086"

LINE_NEWLINE=$'\n'
CEL="C" 
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

        API_STAT=$( echo 'threads' | nc $MINER_API  )
        GPU_TOTAL=0
        GPU_POWER_TOTAL=0
        GPU_SPEED_STAT=0

        IFS='|' read -ra API_STATS <<< "$API_STAT"
        GPU_COUNT=${#API_STATS[@]}

        for (( idx=0; idx<=$GPU_COUNT-1; idx++ )) 
        do
        GPU_ID=$idx
        GPU_SPEED=0 
                GPU_SPEED=$(echo "${API_STATS[$idx]}" | awk -v RS=';' -F'=' '$1=="KHS" {print $2}')
                GPU_SPEED=$(echo "scale=3;$GPU_SPEED/1000" | bc )
        GPU_TOTAL=$(echo "scale=3;$GPU_TOTAL+$GPU_SPEED" | bc)
        ##Read from nvidia-smi
        { IFS=', ' read CURRENT_TEMP CURRENT_FAN POWERDRAW PWRLIMIT; } < <(nvidia-smi -i $GPU_ID --query-gpu=temperature.gpu,fan.speed,power.draw,power.limit --format=csv,noheader,nounits)
                GPU_TEMP=$CURRENT_TEMP
                GPU_POWER=$POWERDRAW
                GPU_POWER_TOTAL=$( echo "scale=0;$GPU_POWER_TOTAL+$GPU_POWER"|bc)
                LINE_MSG+="GPU#$GPU_ID, $GPU_SPEED Mh/s, $GPU_TEMP $CEL, FAN $CURRENT_FAN%, $GPU_POWER W$LINE_NEWLINE"
                #echo "$LINE_MSG"
        done
        LINE_MSG+="Total Speed:$GPU_TOTAL Mh/s$LINE_NEWLINE"
        LINE_MSG+="Total Power:$GPU_POWER_TOTAL W $LINE_NEWLINE"
        echo "$LINE_MSG"

        curl -sS -X POST https://notify-api.line.me/api/notify \
                -H "Authorization: Bearer $LINE_TOKEN" \
                -F "message=$LINE_MSG" > /tmp/line.log  
