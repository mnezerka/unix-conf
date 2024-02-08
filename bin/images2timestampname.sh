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

    fname=$(basename -- "$f")
    extension="${fname##*.}"
    fnamenew="$datetimeoriginal.$extension"

    # check if destination file already exists
    if [[ -f "$fnamenew" ]]; then
        echo "file $fnamenew already exists, adding random suffix"
        fnamenew="$fnamenew$RANDOM"

        if [[ -f "$fnamenew" ]]; then
            echo "file with random suffix already exists, skipping"
            continue
        fi
    fi

    echo "$f -> $fnamenew"
    mv $f "$fnamenew"
done
