#!/bin/bash

source config

docker run -d -p $RDP_PORT:3389 -v $HOME_DIR:/home --shm-size $SHM_SIZE $TAG
