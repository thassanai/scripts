#!/bin/sh

# set clock level 2 # best power consumption
sudo /usr/local/ROC-smi/rocm-smi -d 1 --setsclk 3
sudo /usr/local/ROC-smi/rocm-smi -d 2 --setsclk 2
sudo /usr/local/ROC-smi/rocm-smi -d 3 --setsclk 2
sudo /usr/local/ROC-smi/rocm-smi -d 4 --setsclk 3
sudo /usr/local/ROC-smi/rocm-smi -d 5 --setsclk 2
sudo /usr/local/ROC-smi/rocm-smi -d 6 --setsclk 2
sudo /usr/local/ROC-smi/rocm-smi -d 7 --setsclk 2
sudo /usr/local/ROC-smi/rocm-smi -d 8 --setsclk 2
sudo /usr/local/ROC-smi/rocm-smi -d 9 --setsclk 2
sudo /usr/local/ROC-smi/rocm-smi -d 10 --setsclk 2
sudo /usr/local/ROC-smi/rocm-smi -d 11 --setsclk 2

# set fan 40%=102 ,50% = 128, 60% = 153, 65% = 166, 70% = 178
sudo /usr/local/ROC-smi/rocm-smi -d 1 --setfan 178 -f
sudo /usr/local/ROC-smi/rocm-smi -d 2 --setfan 153 -f
sudo /usr/local/ROC-smi/rocm-smi -d 3 --setfan 153 -f
sudo /usr/local/ROC-smi/rocm-smi -d 4 --setfan 153 -f
sudo /usr/local/ROC-smi/rocm-smi -d 5 --setfan 153 -f
sudo /usr/local/ROC-smi/rocm-smi -d 6 --setfan 153 -f
sudo /usr/local/ROC-smi/rocm-smi -d 7 --setfan 153 -f
sudo /usr/local/ROC-smi/rocm-smi -d 8 --setfan 153 -f
sudo /usr/local/ROC-smi/rocm-smi -d 9 --setfan 153 -f
sudo /usr/local/ROC-smi/rocm-smi -d 10 --setfan 153 -f
sudo /usr/local/ROC-smi/rocm-smi -d 11 --setfan 153 -f
