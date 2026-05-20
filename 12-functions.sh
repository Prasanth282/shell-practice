#!/bin/bash 

userid=$(id -u)

if [ $userid -eq 0 ]

then 
    echo " you have root user privlages"
else 
echo "error :: you don't have root user privlages"
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
    echo " httpd is not installed in server"
    
    dnf install httpd -y

    VALIDATE $? "httpd"
    fi
else
    echo " httpd is already installed in the server nothing to d ..."
fi

dnf list installed nginx

if [ $? -ne 0 ]

then 
    echo " nginx is not installed in server"
    
    dnf install nginx -y

    VALIDATE $? "nginx"
    fi
else
    echo " nginx is already installed in the server nothing to d ..."
fi

dnf list installed python3

if [ $? -ne 0 ]

then 
    echo " python3 is not installed in server"
    
    dnf install python3 -y

    VALIDATE $? "python3"
    fi
else
    echo " python3 is already installed in the server nothing to d ..."
fi
