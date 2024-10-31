#!/usr/bin/env bash

# They must provide only one file
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

# They did not provide a valid directory
if [ ! -d $1 ]; then
    echo "'$1' is not a directory"
fi

# Collect all directories
directories=$(
  find "$1" -maxdepth 1 -type d | while read -r dir; do
    if [[ "$dir" != "$1" ]]; then
      sudo du -hs "$dir"
    fi
  done
)

# Sort and print directories from highest to lowest size
echo "$directories" | sort -hr
