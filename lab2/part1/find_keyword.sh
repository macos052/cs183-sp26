#!/bin/bash

PROJECT_DIR="$1"

if [ -z "$PROJECT_DIR" ]; then
    echo "Usage: $0 <project-folder>"
    exit 1
fi

if [ ! -d "$PROJECT_DIR" ]; then
    echo "Error: Directory '$PROJECT_DIR' does not exist."
    exit 2
fi

echo "Scanning project: $PROJECT_DIR"
echo "Looking for the keywords: TODO, FIXME, STUPID"
echo

# Your codes here
MATCHES=$(grep -r "STUPID" "$PROJECT_DIR")
# Your codes here

if [ -z "$MATCHES" ]; then
    echo "No matches found."
else
    echo "Matches found:"
    echo "$MATCHES"
fi

# Your codes here
TODO_COUNT=$(grep -r "TODO" "$PROJECT_DIR" | wc -l)
FIXME_COUNT=$(grep -r "FIXME" "$PROJECT_DIR" | wc -l)
STUPID_COUNT=$(grep -r "STUPID" "$PROJECT_DIR" | wc -l)
# Your codes here

echo
echo "Keyword frequency:"
echo "TODO: $TODO_COUNT"
echo "FIXME: $FIXME_COUNT"
echo "STUPID: $STUPID_COUNT"
