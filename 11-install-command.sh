#!bin/bash

userid=$(id -u)

if [ $userid -eq 0 ]

then 
    echo " you have root user privlages"
    
else 
echo "error :: you don't have root user privlages"

exit 1

#checking whether ine application is installed in the server or not 

if [ $userid -eq 0 ]

then 

 dnf list installed | grep mysql 

 if [ $? -eq 0 ]

 then 
 echo "mysql is already installed in the server"
 else
  dnf install mysql -y

  exit 1

fi




