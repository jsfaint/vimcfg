#!/bin/bash

os=`uname`

if [[ x$os == x"Darwin" ]]; then
    export PATH=/Library/Developer/CommandLineTools/usr/lib:$PATH
fi

cd ./vimfiles/bundle/youcompleteme/
git submodule update --init --recursive

./install.sh --clang-completer --system-libclang --omnisharp-completer

#tern
cd ../tern_for_vim
if [[ ! -e node_modules/tern ]]; then
    npm install
else
    npm update
fi
