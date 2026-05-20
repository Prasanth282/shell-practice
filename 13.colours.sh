#!/bin/bash

R=\e[31m
Y=\e[33m
G=\e[32m
N=\e[0m

userid=$(id -u)

if [ $userid -eq 0 ]

then 
    echo " you have root user privlages"
else 
echo "-e $R error :: you don't have root user privlages $N"
exit 1
fi

VALIDATE (){ 
    if [ $1 -eq 0 ]

    then 
        echo " $1 installation is successful"
    
    else 
        echo " $1 installation is failed"
        exit 1
    
    fi
}    
dnf list installed httpd 

if [ $? -ne 0 ]

then 
    echo "-e $Y httpd is not installed in server $N"
    
    dnf install httpd -y

    VALIDATE $? "httpd"
    

else
    echo "-e $Y httpd is already installed in the server nothing to d ...$N"
fi

dnf list installed nginx

if [ $? -ne 0 ]

then 
    echo "-e $Y nginx is not installed in server $N"
    
    dnf install nginx -y

    VALIDATE $? "nginx"
    
else
    echo "-e $Y nginx is already installed in the server nothing to d ...$N"
fi

dnf list installed python3

if [ $? -ne 0 ]

then 
    echo "-e $R python3 is not installed in server $N"
    
    dnf install python3 -y

    VALIDATE $? "python3"
    
else
    echo "-e $Y python3 is already installed in the server nothing to d ...$N"
fi
