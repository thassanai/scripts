#!/bin/bash

export GPU_FORCE_64BIT_PTR=0
export GPU_MAX_HEAP_SIZE=100
export GPU_USE_SYNC_OBJECTS=1
export GPU_MAX_ALLOC_PERCENT=100
export GPU_SINGLE_ALLOC_PERCENT=100

./ethdcrminer64 -epool eth-asia1.nanopool.org:9999 -ewal 0x1FBB9199c30e7F619FaBcd64640a76bCa5C15F78.season1060 -epsw x \
-ftime 10 -mport -3333 -dbg -1 -mode 1 \

#-dcri 12 -dpool stratum+tcp://pasc-asia1.nanopool.org:15555 -dwal 86646-64.5b4dc6794640e4c4.rig1060/thassanai.mh@gmail.com -dpsw x -dcoin pasc \
#./ethdcrminer64 -epool eth-eu1.nanopool.org:9999 -ewal 0x1FBB9199c30e7F619FaBcd64640a76bCa5C15F78.season1060 -epsw x \
