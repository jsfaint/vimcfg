#!/bin/bash

os=`uname -o`

if [[ x$os == x"Darwin" ]]; then
    export PATH=/Library/Developer/CommandLineTools/usr/lib:$PATH
fi

cd ./vimfiles/bundle/youcompleteme/
git submodule update --init --recursive
./install.sh --clang-completer --system-libclang
