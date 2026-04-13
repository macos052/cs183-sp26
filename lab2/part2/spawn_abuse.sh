#!/bin/bash

USE_TASKSET=0
PIN_CORE=0

if command -v taskset >/dev/null 2>&1 && taskset -c "$PIN_CORE" true >/dev/null 2>&1; then
    USE_TASKSET=1
fi

spawn_worker() {
    local name="$1"
    local nice_value="$2"

    if [ "$USE_TASKSET" -eq 1 ]; then
        nice -n "$nice_value" taskset -c "$PIN_CORE" \
            bash -c "exec -a \"$name\" yes > /dev/null" &
    else
        nice -n "$nice_value" \
            bash -c "exec -a \"$name\" yes > /dev/null" &
    fi
}

echo "Starting workload processes..."

spawn_worker cpu_abuser_1 0
spawn_worker cpu_abuser_2 0
spawn_worker cpu_abuser_3 5
spawn_worker cpu_abuser_4 10
spawn_worker cpu_abuser_5 15

sleep 1

echo
echo "Current workload processes:"
ps -eo pid,ni,%cpu,args --sort=-%cpu | awk '/cpu_abuser_/'

echo
echo "You can run this script again later to add more workload processes."
