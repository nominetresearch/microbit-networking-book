#!/bin/bash

# run in parent directory
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPTPATH

docker build -t microbit-mkdocs -f Dockerfile_microbit_mkdocs . || exit $?

# docker run --rm microbit-mkdocs

# to debug:
# $ docker run --rm -i -t --entrypoint=  microbit-mkdocs bash
