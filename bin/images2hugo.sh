#!/bin/bash

# create directory

if [ ! -d "middle" ];then
    mkdir middle
fi

for f in *
do
    echo "Processing $f"
    mogrify -path middle -auto-orient -resize 2000x2000\> -quality 90 $f
done
