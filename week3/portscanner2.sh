#!/bin/bash

#variables users must define when running the script

host=$1
port=$2

for i in $(seq 1 254); do
  if  timeout .1 bash -c "echo >/dev/tcp/$host.$i/$port" 2>/dev/null; then
   echo "$host.$i/$port"
  fi
done




