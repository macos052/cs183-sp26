#!/bin/bash

TARGET_NICE=20

# Your codes to renice processes

while true; do
    # Get all cpu_abuser process IDs
    PIDS=$(ps -eo pid,args | awk '/cpu_abuser_/ {print $1}')

    for PID in $PIDS; do
        # set nice value
        renice -n $TARGET_NICE -p "$PID" >/dev/null 2>&1
    done

    sleep 1
done