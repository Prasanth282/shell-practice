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
 
 if [ $? -eq 0 ]

 then
 echo "mysql is not installed in Your server"

 dnf instsall mysql -y

 else
  echo "mysql is already installed in your server"
exit 1

fi