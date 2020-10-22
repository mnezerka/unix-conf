#!/usr/bin/env bash

# exit when any command fails
set -e

middle_max_size=2500
www_max_size=1000
dir_middle="middle"
dir_www="www"

# this is tip how to specify unsharp mask parameters based on
# image size: https://redskiesatnight.com/2005/04/06/sharpening-using-image-magick/

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

    # resize without sharpening
    echo "Resizing $1 to $2x$2px -> $3/$1"
    convert $1 -auto-orient -resize $2x$2 -quality 99 $3/$1

    # resize with sharpening
    sharp_filename=$(add_suffix $1 _sharp)
    echo "Resizing $1 to $2x$2px -> $3/$sharp_filename"
    convert $1 -auto-orient -resize $2x$2 -unsharp 0x0.55+0.55+0.008 -quality 99 $3/$sharp_filename
}

# MAIN 


actions="mw"
action_middle=false
action_www=false


if [ $# -gt 0 ]; then
    actions=$1
fi

echo "Actions: $actions"

if [[ $actions == *"m"* ]]; then
    action_middle=true
fi

if [[ $actions == *"w"* ]]; then
    action_www=true
fi

if [[ "$action_middle" = true ]]; then
    ensure_dir middle
fi

if [[ "$action_www" = true ]]; then
    ensure_dir www
fi

for f in *
do
    echo "Processing $f"
    if [[ "$action_middle" = true ]]; then
        resize $f $middle_max_size $dir_middle
    fi

    if [[ "$action_www" = true ]]; then
        resize $f $www_max_size $dir_www
    fi
done
