#!/bin/bash

# They must provide only one file
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <list>"
    exit 1
fi

list="$1"

# The provided argument is not a readable file
if [[ ! -r "$list" ]]; then
    echo "Error: File '$list' does not exist or is not readable."
    exit 1
fi

# Check if the website is up and running
while read -r line; do
    if ping -c 1 "$line" &> /dev/null; then
        status="up"
    else
        status="down"
    fi
    echo "$line : $status"
done < "$list"
