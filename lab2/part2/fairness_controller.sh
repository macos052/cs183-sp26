#!/bin/bash

TARGET_NICE=0

# Your codes to renice processes

# Get all cpu_abuser process IDs
PIDS=$(ps -eo pid,args | awk '/cpu_abuser_/ {print $1}')

for PID in $PIDS; do
    if kill -0 $PID 2>/dev/null; then
        # Set nice value
        renice -n $TARGET_NICE -p $PID
    fi
done