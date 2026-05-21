#!/bin/bash 

# this script is created to install multiple applications at once in a server and it will store the logs of each step 
Packages="$@"

echo "$Packages" # this will print all the packages which are passed as arguments to the script

USERID=$(id -u)
USERNAME=$USER

LOGS_FOLDER="/var/log/SHELL_LOGS"
SCRIPT_NAME=$(basename $0)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "script executed date is :: $(date)" | tee -a $LOG_FILE

if [ $USERID -eq 0 ]

then 
    echo " $USERNAME has root privlages " | tee -a $LOG_FILE
else  
    echo " error:: $USERNAME don't have root privlages " | tee -a $LOG_FILE
    exit 1
fi 

INSTALL() {
    echo " installing $1 " | tee -a $LOG_FILE
    dnf install $1 -y &>> $LOG_FILE
}

VALIDATE() {
    if [ $1 -eq 0 ]
    then 
        echo " successfully installed $2 "
    else 
        echo " error:: not installed to install $2 "
        INSTALL "$2"
    fi
}

for package in $Packages
do
    dnf list installed $package &>> $LOG_FILE
    VALIDATE $? "$package"
done
#   if [ $? -ne 0 ]
#     then 
#         echo " $1 is not installed, installing now..." | tee -a $LOG_FILE
        
#         dnf install $1 -y
#         VALIDATE $? "$1"
#     else
#         echo "$1 is already isntalled in server nothing to do .." | tee -a $LOG_FILE
#         exit 1
    
#   fi 


