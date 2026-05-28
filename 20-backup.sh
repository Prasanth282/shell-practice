#!/bin/bash
#/home/ec2-user/source /home/ec2-user/destination

SOURCE_DIR=$1
DESTI_DIR=$2
DAYS=${3:-14}

USAGE() {
    echo " USAGE: sh 20-backup.sh <source_folder> <destination_folder> <days> "
}

if [ $# -lt 2 ]
then 
    USAGE
    exit1
fi 

if [ -d $SOURCE_DIR ]
then 
    echo " $SOURCE_DIR directory exists "
else 
    echo " $SOURCE_DIR directory not exists "
    exit 1
fi 
        
if [ -d $SOURCE_DIR ]
then 
    echo " $DESTI_DIR directory exists "
else 
    echo " $DESTI_DIR directory not exists "
    exit 1
fi 

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)

if [ -f "$FILES" ]
then 
    echo " files are present in the directory. files are zipping "
    TIME_STAMP="$(date +%F-%H-%M-%S)"
    ZIP_FILE="$DESTI_DIR/$@-$TIME_STAMP.zip"
    $FILES | zip -@ "$ZIP_FILE"

    if [ -f "$FILES" ]
    then 
        echo " files are zipped successfully "
    else 
        echo " zipping files are failed "
    fi 
else 
    echo " files are not found to zip "

fi


     