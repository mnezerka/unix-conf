#!/usr/bin/env bash

# exit when any command fails
set -e

GPXCLI="${GPXCLI:-~/projects/gpxcli/gpxcli}"

function usage() {
    echo "Usage: $0 [FILE]..."
}

# MAIN

# check if gpxcli is available
if [ -f "$GPXCLI" ]; then
   echo "gpxcli found"
else
   echo "$GPXCLI does not exist. Set GPXCLI env variable."
   exit 1
fi

if [ $# -eq 0 ]; then
    echo "error: no input files"
    usage
    exit 3
fi

for f in $@
do
    bf="$f.backup"
    sf="$f.simplified"
    echo "processing $f"
    ${GPXCLI} simplify -o $sf $f && mv $f $bf && mv $sf $f
done
