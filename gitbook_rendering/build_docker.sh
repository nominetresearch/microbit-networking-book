#!/bin/bash

# run in parent directory
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPTPATH

docker build -t microbit-gitbook  -f Dockerfile_microbit_gitbook . || exit $?

#docker run --rm microbit-gitbook
#docker-compose -f docker-compose_microbit_gitbook.yml up

# to debug:
# $ docker run --rm -i -t --entrypoint=  microbit-gitbook bash

# to get into running compose
# docker exec -it $(docker ps -q --filter="name=microbit-gitbook") bash
