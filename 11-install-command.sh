#!/bin/bash

userid=$(id -u)

if [ $userid -eq 0 ]

then 
    echo " you have root user privlages"
else 
echo "error :: you don't have root user privlages"
exit 1

fi 

#checking whether ine application is installed in the server or not 
 
dnf list installed mysql 
 
if [ $? -ne 0 ]

then
 echo "mysql is installed in your server"
exit 1
 
dnf install mysql -y

  if [ $? -eq 0 ]

  then
    echo "mysql is successfully installed in your server"
    else        
    echo "failed to install mysql in your server"
exit 1

fi 

else 
    echo "mysql already installed nothing to do"
 fi