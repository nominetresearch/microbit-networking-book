#!/bin/bash

# get build hash
GIT_HASH=`git rev-parse --short HEAD`
echo "git hash=$GIT_HASH"
BUILD_VERSION="unofficial.git${GIT_HASH}"


# clean
mkdir -p rpmbuild
rm -rf rpmbuild/*

mkdir -p RPMS/noarch

# build
export SOURCE_DIR=`pwd`

rpmbuild -v -bb --define "_topdir rpmbuild" --define "_build_version $BUILD_VERSION" --clean microbit-networking-online.spec || exit $?


# retrieve RPMs from build dir
cp rpmbuild/RPMS/noarch/*.rpm RPMS/noarch/

rm -rf rpmbuild

