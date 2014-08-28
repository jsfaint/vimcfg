#!/bin/bash

export PATH=/Library/Developer/CommandLineTools/usr/lib:$PATH

cd ./vimfiles/bundle/youcompleteme/
git submodule update --init --recursive
./install.sh --clang-completer --system-libclang

#--clang-completer #With semantic support for C-family language
#--omnisharp-completer #With semantic support for C#
