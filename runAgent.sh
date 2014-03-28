#!/bin/bash
#
# usage: ./runAgent.sh [-h] [agent-class-name]

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "usage: $0 [-h] [agent-class-name]"
    echo 
    echo "Runs simulation..." | fold -s
    echo
    echo "positional arguments:"
    echo "  agent-class-name      The name of the agent class to run"
    echo "                        defaults to SampleAdNetwork"
    echo
    echo "optional arguments:"
    echo "  -h, --help            show this help message and exit"
    exit
fi

AGENT_PACKAGE='edu.umich.tacadx.agents.'
DEFAULT_AGENT_NAME='SampleAdNetwork'
CONFIG_NAME='config/config.conf'
DIR="$(dirname "$0")"

if [[ -n "$1" ]]; then
    AGENT_NAME="$1"
else
    AGENT_NAME="${DEFAULT_AGENT_NAME}"
fi

# Create customized config file
sed -e's/{:JAVA NAME:}/'"${AGENT_PACKAGE}${AGENT_NAME}"'/' \
    "${DIR}/config/template.conf" > "${DIR}/${CONFIG_NAME}"

# Run simulation
java -cp "${DIR}/lib/*:${DIR}/tac-adx/AdX/adx-agnet/lib/*:${DIR}/dist/*" tau.tac.adx.agentware.Main -config "${DIR}/${CONFIG_NAME}"
