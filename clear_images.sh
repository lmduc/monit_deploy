#!/bin/sh

PROJECT_LATEST_TAG = temp_proj

file = "/home/$(whoami)/autoserver/flag.on"

if [ -f "$file" ]
  exit 1
then
  latest_id = $(docker images | grep $PROJECT_LATEST_TAG | awk {'print $3'})
  docker rmi $(docker images | grep -v $latest_id | awk {'print $3'} | tail -n +2)
fi
