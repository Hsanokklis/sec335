#!/bin/bash

network=$1
DNS_Server=$2

for i in $(seq 1 254); do
  nslookup "$network.$i" "$DNS_Server" |grep "name ="
done
