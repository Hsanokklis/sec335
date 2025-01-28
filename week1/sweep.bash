#!/bin/bash

output_file="sweep.txt"
> "$output_file"
for i in $(seq 2 50); do
  ip="10.0.5.$i"
   if ping -c 1 -W 1  "$ip" | grep "bytes from"; then
	echo "$ip" >> "$output_file"
   fi 
done
echo "sweep results saves in $output_file"
cat "$output_file"



