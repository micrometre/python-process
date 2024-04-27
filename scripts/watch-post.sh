#!/bin/bash
#for run in {1..1000}; do curl localhost:5000/watch -d '{"foo": "bar"}' -H 'Content-Type: application/json'; done
#	inotifywait -m static/alprd1_images/ -r -e close_write --format '%w%f'

dir=static/alprd1_images
inotifywait -m "$dir" -e close_write --format '%w%f' |
    while IFS=' ' read -r fname
    do
        #[ -f "$fname" ] && echo "$fname" 
       # data=$fname
        #echo $data
        #curl -x POST 127.0.0.1:5000/watch 
        curl -d "$fname" -X POST http://localhost:5000/watch

        #curl localhost:5000/watch -d '{"foo": "bar" }' -H 'Content-Type: application/json'
    done