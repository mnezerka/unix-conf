#!/usr/bin/env bash

# exit when any command fails
set -e

mod_suffix="mod"

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "Script is located in: $script_dir"

imgproc_dir="${script_dir%/*}/imgproc"
echo "imgproc dir: $imgproc_dir"

gradients=("$imgproc_dir/gradient_grays*")

echo "available gradients:"
for g in ${gradients}; do
    echo "- $g";
done

function add_suffix() {
    if [ $# -ne 2 ]; then
        echo "Illegal number of parameters for add_suffix(filename, suffix)"
        exit 1
    fi

    extension=${1##*.}

    if [ -z $extension ]; then
        echo "$1$2"
    else
        echo "${1%.$extension}$2.$extension"
    fi
}

function get_suffix() {
    if [ $# -ne 1 ]; then
        echo "Illegal number of parameters for get_suffix(filename)"
        exit 1
    fi

    local path="$1"

    # Remove directory
    local name="${path##*/}"

    # Remove file extension
    name="${name%.*}"

    # Take part after last underscore
    echo "${name##*_}"
}

function contrast() {
    if [ $# -ne 1 ]; then
        echo "Illegal number of parameters for contrast(image)"
        exit 1
    fi

    o_filename=$(add_suffix $1 $mod_suffix)
    echo $o_filename

    for g in ${gradients}; do
        echo $g;
        gtype="$(get_suffix $g)"
        of=$(add_suffix $1 ${mod_suffix}c_${gtype})

        echo $of

        magick $1 $g -clut $of
    done
}

function usage() {
    echo "Usage: $0 ACTION [FILE]..."
    echo
    echo "Where ACTION is string composed of:"
    echo "  c - generate contrast variants"
}

# MAIN

if [ $# -gt 0 ]; then
    actions=$1
    shift
else
    usage
    exit 1
fi


if [[ ! "${actions}" =~ ^[c]+$ ]]; then
   echo "error: invalid ACTION '${actions}'"
   usage
   exit 2
fi

if [ $# -eq 0 ]; then
    echo "error: no input files"
    usage
   exit 3
fi

for f in $@
do
    echo "---------------------------------------"
    echo "processing $f"

    # skip directories
    if [[ -d "$f" ]]; then
        echo "  .skip directory"
        continue
    fi

    if [[ $actions == *"c"* ]]; then
        echo "modify contrast"
        contrast $f
    fi
done
