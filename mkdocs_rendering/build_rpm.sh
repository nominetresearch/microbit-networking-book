#!/bin/bash

#=============================================================================
# context from TeamCity / git

# get build number (numeric, monotonic) from CI
echo "CI build number: BUILD_NUMBER=$BUILD_NUMBER"

# get branchbuild Id from CI
echo "CI build branch: TEAMCITY_BUILD_BRANCH=$TEAMCITY_BUILD_BRANCH"

# get git build hash from Teamcity
echo "CI build git hash: TEAMCITY_BUILD_VERSION=$TEAMCITY_BUILD_VERSION"

if [ ! -z "$TEAMCITY_BUILD_BRANCH" ] && [ ! -z "$TEAMCITY_BUILD_VERSION" ] && [ ! -z "$BUILD_NUMBER" ]; then
	echo "we're running in teamcity:"
	TEAMCITY_BUILD="yes"
	TEAMCITY_BUILD_NUMBER=$BUILD_NUMBER
	GIT_BRANCH=$TEAMCITY_BUILD_BRANCH
	GIT_HASH=$TEAMCITY_BUILD_VERSION
else
	echo "not running in TeamCity"
	GIT_BRANCH=`git rev-parse --abbrev-ref HEAD` || exit 1
	GIT_HASH=`git rev-parse --verify HEAD` || exit 1
fi


if [ -z $GIT_BRANCH ]; then
	echo "failed to detect git branch"
	exit 1
fi
if [ -z $GIT_HASH ]; then
	echo "failed to detect git hash"
	exit 1
fi

GIT_HASH_SHORT=${GIT_HASH:0:7}
echo "git branch=$GIT_BRANCH"
echo "git hash=$GIT_HASH"
echo "git hash short=$GIT_HASH_SHORT"


# generate build number
if [ "$BUILD_NUMBER" == "" ]; then
	echo "not running in CI; unofficial RPM"
	export BUILD_VERSION="unofficial.git${GIT_HASH_SHORT}"
else
	export BUILD_VERSION="${BUILD_NUMBER}.git${GIT_HASH_SHORT}"
fi

echo "BUILD_VERSION=$BUILD_VERSION"
echo

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

