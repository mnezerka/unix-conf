#!/usr/bin/env bash

# exit when any command fails
set -e

i=10 
for f in images/*;
do
    echo "- { src: \"$f\", title: \"\", params: {weight: $i}}"
    ((i=i+10))
done
