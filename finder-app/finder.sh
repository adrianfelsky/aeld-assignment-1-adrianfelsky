#!/bin/sh

if [ $# -lt 2 ]; then
    echo "Error: Missing arguments. Usage: $0 <filesdir> <searchstr>" >&2
    exit 1
fi

filesdir=$1
searchstr=$2

if [ ! -d "$filesdir" ]; then
    echo "Error: '$filesdir' is not a valid directory." >&2
    exit 1
fi

X=$(find "$filesdir" -type f | wc -l)
Y=$(grep -r "$searchstr" "$filesdir" | wc -l)

echo "The number of files are ${X} and the number of matching lines are ${Y}"
