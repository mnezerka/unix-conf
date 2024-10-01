#!/usr/bin/env bash

# Recommended resolution & aspect ratios
# 4320p (8k): 7680x4320.
# 2160p (4K): 3840x2160.
# 1440p (2k): 2560x1440.
# 1080p (HD): 1920x1080.
# 720p (HD): 1280x720.
# 480p (SD): 854x480.
# 360p (SD): 640x360.
# 240p (SD): 426x240.
 
# exit when any command fails
set -e

function usage() {
    echo "Usage: $0 IN-FILE OUT-FILE"
}

# MAIN

if [ $# -gt 1 ]; then
    ffmpeg -i $1 -filter:v scale=854x480 -c:a $2
    # auto aspect ratio
    # ffmpeg -i $1 -filter:v scale=854:-1 -c:a $2
else
    usage
    exit 1
fi

