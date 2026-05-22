#!/bin/bash

# this script used to print the different applications using for loop 

USERID=$(id -u)
USERNAME=$USER

packages=(httpd mariadb-server php)

if [ $USERID -eq 0 ]
then 
    echo " $USERNAME has root privlages to run the script "
else 
    echo "error:: $USERNAME not having root privlaeges to run the script"
    exit 1
fi 

INSTALL() {
   
        dnf install $1 -y ]
        VALIDATE $? $1
    }    

VALIDATE (){
    if [ $1 -eq 0 ]
    then 
        echo "succcessfully installed $2"
    else
        echo "installing failed $2"
    fi
}

for package in "${packages[@]}"
do 
dnf list installed "$package"
 if [ $? -ne 0 ]
    then 
        echo "$package is not installed. installing now .."
        INSTALL "$package"
    fi
done