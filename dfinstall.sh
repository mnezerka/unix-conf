#!/usr/bin/env bash

for d in "shell vim";
do
    ( stow $d )
done
