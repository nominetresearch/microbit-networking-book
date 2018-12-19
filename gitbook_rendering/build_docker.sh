#!/bin/bash

# run in parent directory
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPTPATH

docker build -t microbit-gitbook  -f Dockerfile_microbit_gitbook . || exit $?

# docker run --rm microbit-gitbook

# to debug:
# $ docker run --rm -i -t --entrypoint=  microbit-gitbook bash

