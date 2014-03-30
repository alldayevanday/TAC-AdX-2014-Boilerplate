#!/bin/bash
#
# usage: ./runServer.sh [-h]

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "usage: $0 [-h]"
    echo 
    echo "Runs a sample TAC server on localhost"
    echo
    echo "optional arguments:"
    echo "  -h, --help            show this help message and exit"
    exit
fi

DIR="$(dirname "$0")"
cd "${DIR}/tac-adx/AdX/adx-server"
pwd
java -cp "lib/*" se.sics.tasim.sim.Main
