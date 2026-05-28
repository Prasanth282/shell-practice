#!/bin/bash

#  this script will delete the old logs created on the path older than 14 days 
#    1.we need source file path to delete the files 
#    2.filter the files older than 14 days 
#    3.thn we need to delete the files 

SOURCE_DIR=/home/ec2user/oldlogs.log

DELETE_OLD_LOGS= find $SOURCE_DIR -name "*.log" -mtime +14
 
while IFS= read -r filepath
do 
  echo " deleting "$filepath"
  rm -rf "$filepath"
  
done <<<$DELETE_OLD_LOGS