#!/bin/bash

# create directory

if [ ! -d "middle" ];then
    mkdir middle
fi

for f in *
do
    echo "Processing $f"
    mogrify -path middle -auto-orient -resize 2500x2500 -quality 99 $f
done
