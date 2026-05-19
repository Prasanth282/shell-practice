#!bin/bash 

NUMBER1=100
NUMBER2=$200

Timestamp=$(date)
sum=$(($NUMBER1+$NUMBER2))

echo "the script executed at $Timestamp"
echo "sum of $NUMBER1 and $NUMBER2 is $sum"

