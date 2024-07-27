#!/usr/bin/env bash

# Windows Snipping Tool Script:

file=$HOME/.cache/Capture_$(uuidgen).png
scrot -s $file
xclip -selection clipboard -t image/png -i $file
rm $file
