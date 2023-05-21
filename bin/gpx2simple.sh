#!/usr/bin/env bash

# exit when any command fails
set -e



function usage() {
    echo "Usage: $0 [FILE]..."
}

# MAIN

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
    ~/projects/gpxcli/gpxcli simplify -o $sf $f && mv $f $bf && mv $sf $f
done
