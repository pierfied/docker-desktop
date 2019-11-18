#!/bin/bash

source config

docker build -t $TAG --build-arg USERNAME=$USERNAME --build-arg PASSWORD=$PASSWORD .

docker run --rm -v $HOME_DIR:/tmp_home $TAG /bin/bash -c "cp -rp home/* tmp_home"
