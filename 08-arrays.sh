#!bin/bash
#array takes all the declared names as starts from 01234 like that 
names=("varun" "modi" "venkat")

echo "the first name is ${name[0]}"
echo "the second name is ${name[3]}"
echio "the third name is ${name[1]}"

#@ represents all the names it will print all 

echo "all names ${names[@]}
