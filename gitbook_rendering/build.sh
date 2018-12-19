#!/bin/bash

cd /shared/ || exit $?

echo "doing `gitbook install` to install plugins"
gitbook install

echo "doing `gitbook build` to build site"
gitbook build

# we no longer need node_modules (& owned by root)
rm -rf /shared/node_modules

# make output files deletable by user
find /shared/_book | xargs chown --reference=/shared


