#!/bin/bash

# create directory

if [ ! -d "www" ];then
    mkdir www
fi

for f in *
do
    echo "Processing $f"
    mogrify -path www -auto-orient -resize 1000x900 -quality 90 $f
done
