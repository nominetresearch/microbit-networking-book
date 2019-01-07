#!/bin/bash

cd /shared/ || exit $?

echo "doing \`mkdocs build\` to build site"
echo "NB pay attention to the following warnings...!"
echo
rm -rf /shared/site
mkdocs build

# make output files deletable by user
find /shared/site | xargs chown --reference=/shared
