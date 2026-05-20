#!/bin/bash

userid=$(id -u)

if [ $userid -eq 0 ]

then 
    echo " you have root user privlages"
else 
echo "error :: you don't have root user privlages"
exit 1 #we can give upto 127 any nbr 

fi 

#checking whether ine application is installed in the server or not 
 
dnf list installed mysql 

if [ $? -ne 0 ]

then 
    echo " mysql is not installed in server"
    
    dnf install mysql -y

    if [ $? -eq 0 ]

    then 
        echo " mysql installation is successful"
        exit 1
    else 
        echo " mysql installation is failed"
    fi
else 
    echo " mysql is already installed in the server nothing to d ..."
fi