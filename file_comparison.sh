#!/usr/bin/env bash

# They must provide at least two files
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <file1> <file2> ..."
    exit 1
fi

# Instead of printing if each file is identical
# We will check them all collectively
identical=true

# Loops through every given argument
for file in "$@"; do
    # Skip on the first iteration
    # We don't want to compare the first file to itself
    if [ "$file" == "$1" ]; then
        continue
    fi

    # Checks if the file exists
    if [ -e "$file" ]; then
        # Compares the files byte by byte
        if cmp -s "$file" "$1"; then
            continue
        else
            echo "File '$file' is different from '$1'"
            identical=false
            break
        fi
    else
        echo "File '$file' does not exist"
        identical=false
        break
    fi
done

# If all files are identical, inform the user
if $identical; then
    echo "All files are identical to '$1'"
fi
