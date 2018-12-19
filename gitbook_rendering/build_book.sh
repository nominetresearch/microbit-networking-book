#!/bin/bash

./build_docker.sh || exit $?

# git equivalent to "svn export"...
echo "exporting source"
rm -rf exported_source/ || exit 1
mkdir -p exported_source/ || exit 1
(cd .. && git checkout-index -a --prefix=gitbook_rendering/exported_source/) || exit 1

# but we don't want (or need) this build directory
rm -rf exported_source/gitbook_rendering

echo "running docker build"
docker run --rm  --volume=`pwd`/exported_source:/shared:z microbit-gitbook

# TODO set permissions / generate RPM

echo "generating tarfile (NB tarbomb)"
rm -f microbit_book.tgz
(cd exported_source/_book && tar cfz ../../microbit_book.tgz *)

echo "cleanup"
rm -rf exported_source/

