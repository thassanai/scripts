@echo on

setx GPU_FORCE_64BIT_PTR 0
setx GPU_MAX_HEAP_SIZE 100
setx GPU_USE_SYNC_OBJECTS 1
setx GPU_MAX_ALLOC_PERCENT 100
setx GPU_SINGLE_ALLOC_PERCENT 100

EthDcrMiner64.exe -epool eth-asia1.nanopool.org:9999 -ewal 0x3b0558e798C539f95589E9105a0361b29A999A94.season1123/thassanai.mh@gmail.com -epsw x -mode 1 -ftime 10 -mport -3333 -dbg -1 -wd 0 -asm 0,0,0,0,0,0,0 -dcri 9,9,9,9,9,9,9 -cclock 1130,1130,1130,1130,1130,1130 -cvddc 850,850,850,850,850,850 -mclock 2100,2100,2100,2100,2100,2100
