#!/usr/bin/env bash

# exit when any command fails
set -e

middle_max_size=2500
www_max_size=1000
dir_middle="middle"
dir_www="www"

function ensure_dir() {
    if [ ! -d "$1" ];then
        echo "Creating directory $1"
        mkdir $1
    else
        echo "Directory $1 already exists"
    fi
}

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

function resize() {
    if [ $# -ne 3 ]; then
        echo "Illegal number of parameters for resize(image, size, dir)"
        exit 1
    fi

    # this doesn't work yet
    if [[ -f "$3/$1" ]]; then
        echo "  .skip, target image already exists"
        return
    fi

    # resize without sharpening
    #disabled echo "Resizing $1 to $2x$2px -> $3/$1"
    #disabled convert $1 -auto-orient -resize $2x$2 -quality 99 $3/$1

    # resize with sharpening
    # this is tip how to specify unsharp mask parameters based on
    # image size: https://redskiesatnight.com/2005/04/06/sharpening-using-image-magick/
    sharp_filename=$(add_suffix $1 _sharp)
    echo "  .resize $1 to $2x$2px -> $3/$sharp_filename"
    # radius,sigma,amount, treshold
    convert $1 -auto-orient -resize $2x$2 -unsharp 0x0.55+0.45+0.008 -quality 99 $3/$sharp_filename
}

function containsElement() {
    # shift shifts the argument list by 1 to the left (dropping the first
    # argument) and for without an in implicitly iterates over the argument
    # list.
    local e match="$1"
    shift
    for e; do [[ "$e" == "$match" ]] && return 0; done
    return 1
}

function fix_filename() {
    if [ $# -ne 1 ]; then
        echo "error: illegal number of params for fix_filename(filename)"
        exit 1
    fi

    if [[ $actions == *"l"* ]]; then
        lower=`echo $1 | tr "[:upper:]" "[:lower:]"`
        echo $lower
    else
        echo $1
    fi
}

function usage() {
    echo "Usage: $0 ACTION [FILE]..."
    echo
    echo "Where ACTION is string composed of:"
    echo "  m - resize images to middle size (longer side ${middle_max_size})"
    echo "  w - resize images to www size (longer side ${www_max_size})"
    echo "  l - rename all files to lowercase before resizing"
}

# MAIN

if [ $# -gt 0 ]; then
    actions=$1
    shift
else
    usage
    exit 1
fi


if [[ ! "${actions}" =~ ^[mwl]+$ ]]; then
   echo "error: invalid ACTION '${actions}'"
   usage
   exit 2
fi

if [ $# -eq 0 ]; then
    echo "error: no input files"
    usage
   exit 3
fi


if [[ $actions == *"m"* ]]; then
    ensure_dir middle
fi

if [[ $actions == *"w"* ]]; then
    ensure_dir www
fi

for f in $@
do
    echo "$f"

    # skip directories
    if [[ -d "$f" ]]; then
        echo "  .skip directory"
        continue
    fi

    # rename file to lowercase if requested
    if [[ $actions == *"l"* ]]; then
        f_lower=`echo $f | tr "[:upper:]" "[:lower:]"`
        if [[ "$f" != "$f_lower" ]]; then
            echo "  .rename: $f -> $f_lower"
            mv "$f" "$f_lower"
            f=$f_lower
        fi
    fi

    if [[ $actions == *"m"* ]]; then
        resize $f $middle_max_size $dir_middle
    fi

    if [[ $actions == *"w"* ]]; then
        resize $f $www_max_size $dir_www
    fi

done
