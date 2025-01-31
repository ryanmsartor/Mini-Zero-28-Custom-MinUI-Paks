#!/bin/sh

export HOME="$(dirname "$0")"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH":"$HOME/lib"

cd $HOME
./retroarch -v >./retroarch.log 2>&1
