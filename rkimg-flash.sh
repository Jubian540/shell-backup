#!/bin/bash

set -eo pipefail

if [[ "$(id -u)" -ne "0" ]]; then
    echo "This script requires root."
    exit 1
fi

upgrade_tool ef $1
upgrade_tool uf $1
