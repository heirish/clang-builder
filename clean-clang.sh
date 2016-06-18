#!/bin/bash
##
##  Script: clean-clang.sh
##
##  This top-level script removes all output of the build, letting the user
##  start from scratch.
##
##- Make sure we're in the same directory as this script.
##
export TOP_DIR="$(cd "$(dirname "$0")" && pwd)"
cd $TOP_DIR

##- Get the GCC- and CLANG-related variables for this build.
##
source ./clang-build-vars.sh

##- Clean up after LLVM and CLANG.
##
rm -rf ./dist
rm -rf ./packages

if [ -n "$DO_CLANG" ]
then
    echo -n "removing LLVM and CLANG source and build directories... "
    sudo rm -rf $CLANG_SRC_DIR
    sudo rm -rf $CLANG_BLD_DIR
    echo "done"
fi

##- Clean up after LIBCXX
##
cd $TOP_DIR
if [ -n "$DO_CXXLIB" ]
then
    echo -n "removing libc++ source and build directories... "
    sudo rm -rf $LIBCXX_SRC_DIR
    sudo rm -rf $LIBCXX_BLD_DIR
    echo "done"
fi

echo ""
