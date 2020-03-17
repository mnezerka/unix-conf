#!/bin/bash

ffmpeg -i $1 -acodec mp3 "${1%.*}.mp3"

