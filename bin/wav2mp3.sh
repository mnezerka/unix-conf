#!/bin/bash

lame -h $1 "${1%.wav}.mp3"
