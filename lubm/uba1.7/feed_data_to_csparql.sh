#!/bin/bash

data_dir=/Users/oshani/Projects/streaming-collustra/lubm/uba1.7/data_ttl/*
server_stream_url=http://air.csail.mit.edu:8175/streams/http%3A%2F%2Fex.org%2Fgcm

for entry in $data_dir
do
    curl -X POST -H 'Content-Type: text/plain; charset=UTF-8' -d @$entry $server_stream_url
done
