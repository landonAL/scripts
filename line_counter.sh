#!/bin/bash

# They must provide at least one file
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <file1> ..."
    exit 1
fi

# Loops through every given argument
for file in "$@"; do
    # Checks if the file exists and is readable
    if [ -e "$file" ] && [ -r "$file" ]; then
        # Putting the "<" in the command
        # Gives wc the contents of $file directly
        # Rather than treating $file as an argument
        echo "$file : $(wc -l < "$file")"
    else
        echo "File '$file' does not exist"
        break
    fi
done
