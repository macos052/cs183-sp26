#!/bin/bash
LOGFILE="/Users/matthewacosta/cs183-sp26/lab2/part3/health.log"
# Your codes here

# Date and time
echo "Date: $(date)" > $LOGFILE

# Hostname
echo "Hostname: $(hostname)" >> $LOGFILE

# Uptime and load average
echo "Uptime and Load:" >> $LOGFILE
uptime >> $LOGFILE

# Disk usage of root (/)
echo "Disk Usage (/):" >> $LOGFILE
df -h / >> $LOGFILE

# Memory usage
echo "Memory Usage:" >> $LOGFILE
vm_stat >> $LOGFILE