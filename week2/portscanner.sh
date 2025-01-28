#!/bin/bash

#variables users must define when running the script

hostfile=$1
portfile=$2
outputfile=$3

if [[ -z $outputfile ]]; then
  outputfile="results.csv"
fi

echo "host,port,status" > "$outputfile"

#displays the outcome of the following commands.
#Status was added to show weather a TCP connection was a success/failure

echo "host,port,status can be found in "$outputfile""

#reads each line the hostfile/portfile and assigns a value to host and port

for host in $(cat $hostfile); do
  for port in $(cat $portfile); do

    if timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null; then
      echo "$host,$port,success" >> "$outputfile"
    else
      echo "$host,$port,failure" >> "$outputfile"
    fi
 done
done

#command above attempts to establish a connect with the hosts
#and ports specified
