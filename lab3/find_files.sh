#!/bin/bash

echo 'Find all files in /bin, /sbin, /usr/bin, and /usr/sbin that are setuid and owned by root.'
read -p "Hit any key to continue."

bin=$(find /bin /sbin /usr/bin  /usr/sbin -perm -4000 -user root -type f 2>/dev/null)

echo "$bin"
read -p "Hit any key to continue."

echo 'Find all files across the entire filesystem that have setuid or setgid enabled (regardless of owner).'
read -p "Hit any key to continue."

bin=$(find /bin /sbin /usr/bin /usr/sbin /usr/local/bin /usr/local/sbin /usr/lib /usr/lib64 \( -perm -4000 -o -perm -2000 \) -type f 2>/dev/null)

echo "$bin"
read -p "Hit any key to continue."

echo 'Find all files in /var that have changed in the last 20 minutes.'
read -p "Hit any key to continue."

bin=$(find /var -type f -cmin -20)

echo "$bin"
read -p "Hit any key to continue."

echo 'Find all files in /var that are regular files of zero length.'
read -p "Hit any key to continue."

bin=$(find /var -type f -size 0)

echo "$bin"
read -p "Hit any key to continue."

echo 'Find all files in /dev that are not regular files and also not directories. Include permissions and modification times.'
read -p "Hit any key to continue."
bin=$(sudo find /dev ! -type f ! -type d -ls)
echo "$bin"
read -p "Hit any key to continue."

echo 'Find all directories in /home that are not owned by root. In the same command, change their permissions to 711.'
read -p "Hit any key to continue."

bin=$(find /home -type d ! -user root -exec chmod 711 {} \;)

echo "$bin"
read -p "Hit any key to continue."

echo 'Find all regular files in /home that are not owned by root. In the same command, change their permissions to 755.'
read -p "Hit any key to continue."
bin=$(find /home ! -user root -type f -exec chmod 755 {} \;)

echo "$bin"
read -p "Hit any key to continue."

echo 'Find all files of all types in /etc that have changed in the last 5 days.'
read -p "Hit any key to continue."

bin=$(find /etc -ctime -5)

echo "$bin"
read -p "Hit any key to continue."
