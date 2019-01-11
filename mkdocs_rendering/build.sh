#!/bin/bash

cd /shared/mkdocs_rendering || exit $?

echo "doing \`mkdocs build\` to build site"
echo "NB pay attention to the following warnings...!"
echo
rm -rf /shared/mkdocs_rendering/site
mkdocs build

# make output files deletable by user
find /shared/mkdocs_rendering/site | xargs chown --reference=/shared/mkdocs_rendering
