#!/bin/bash

source config

docker run --rm -v $HOME_DIR:/tmp_home ubuntu:rolling /bin/bash -c "rm -rf tmp_home"
