#!/bin/bash
for run in {1..1000}; do curl localhost:5000/watch -d '{"foo": "bar"}' -H 'Content-Type: application/json'; done