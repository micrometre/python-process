#!/bin/bash
dir=static/alprd1_images
inotifywait  -m "$dir" -e close_write --format '%w%f' |
    while IFS=' ' read -r fname
    do
        curl -d "$fname" -X POST http://localhost:5000/watch

    done