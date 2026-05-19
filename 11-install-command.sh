#!/bin/bash

userid=$(id -u)

if [ $userid -eq 0 ]

then 
    echo " you have root user privlages"
    
else 
echo "error :: you don't have root user privlages"

#checking whether ine application is installed in the server or not 
 
 dnf list installed | grep mysql 
 
 if [ $? -eq 0 ]
 
 then
 echo "mysql is already installed in the server"
 else
  dnf install mysql -y

 fi