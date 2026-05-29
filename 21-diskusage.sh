#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Use)
THRESHOLD_LIMIT=1
MSG=''
IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

while IFS= read -r line 
do 
   USAGE=$(echo $line | awk '{print $6}' | cut -d '%' -f1)
   PARTITION=$(echo "$line" "awk '{print $7}'")

   if [ "$USAGE" -ge "$THRESHOLD_LIMIT" ]
   then 
    echo " server : $IP "
    MSG+="high disk usage found in : $PARTITION : $USAGE\n"
   fi           

done <<< "$DISK_USAGE" 

echo -e "$MSG"