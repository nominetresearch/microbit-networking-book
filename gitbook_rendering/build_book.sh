#!/bin/bash


# git equivalent to "svn export"...
rm -rf exported_source/ || exit 1
mkdir -p exported_source/ || exit 1
(cd .. && git checkout-index -a --prefix=gitbook_rendering/exported_source/) || exit 1

# but we don't want (or need) this build directory
rm -rf gitbook_rendering/exported_source/gitbook_rendering

# make a fingerprint of all the exported source, so docker invalidates its cache properly
#find exported_source/ -type f | grep -v md5sum | xargs md5sum > exported_source_fingerprint.txt
