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
    # skip directories
    if [[ -d "$f" ]]; then
        echo "  .skip directory"
        continue
    fi

    # get date and time of exposure from EXIF and convert it to YYMMDD_HHMMSS format
    datetimeoriginal=$(identify -format '%[EXIF:DateTimeOriginal]' $f | sed 's/://g' | sed 's/ /_/g')

    filename=$(basename -- "$f")
    extension="${filename##*.}"
    #filename="${filename%.*}"

    echo "$f -> $datetimeoriginal.$extension"
    mv $f "$datetimeoriginal.$extension"
done
