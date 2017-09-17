#!/usr/bin/env bash

# Claymore Linux Line Notify 
# Thassanai Mhuansean

LINE_TOKEN=''
LINE_MINER='Miner01'
CLAYMORE_API="localhost 3333"


LINE_NEWLINE=$'\n'
CEL="C" 
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

        API_STAT=$( echo '{"id":0,"jsonrpc":"2.0","method":"miner_getstat1"}' | nc $CLAYMORE_API  )
        GPU_COUNT=$( echo $API_STAT | jq '.result[3]' | tr -cd ';' | wc -c )
        LINE_MSG="$LINE_MINER $LINE_NEWLINE"
        GPU_TOTAL=0
        GPU_POWER_TOTAL=0
        GPU_SPEED_STAT=$( echo $API_STAT | jq '.result[3]'| tr -d '"')

        for (( idx=0; idx<=$GPU_COUNT; idx++ )) 
        do
                GPU_ID=$idx
                GPU_SPEED=0 #$(echo "$object" | jq '.speed_sps' )
                IFS='; ' read -r -a GPU_SPEED_A  <<< "$GPU_SPEED_STAT"
                GPU_SPEED="${GPU_SPEED_A[$idx]}"

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
        LINE_MSG+="Total Power:$GPU_POWER_TOTAL W"

        curl -sS -X POST https://notify-api.line.me/api/notify \
                -H "Authorization: Bearer $LINE_TOKEN" \
                -F "message=$LINE_MSG" > /tmp/line.log  


        if [ $GPU_TOTAL = 0 ]; then
        LINE_MSG="Reboot Rig Now"
        curl -sS -X POST https://notify-api.line.me/api/notify \
                -H "Authorization: Bearer $LINE_TOKEN" \
                -F "message=$LINE_MSG" > /tmp/line.log
        shutdown -r now
        fi
        
