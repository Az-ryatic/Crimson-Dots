#!/bin/bash

# PATH OF THE FRAMES
PATHFRAME=~/Videos/Crimson # define the path for retrieving your frames

# FRAME FORMAT (OPTIONS: png/jpg)
FORMAT=gif

# BACKGROUND (OPTIONS: center, max, scale, fill, tile)
BG="--bg-fill"

type feh || { echo "You need feh!" ; exit 1 ; }

while true; do
    for img in $(find ${PATHFRAME} -type f -name "*.${FORMAT}" | sort -V); do
        feh --no-fehbg ${BG} "${img}"
	sleep 0.0001
    done
done
