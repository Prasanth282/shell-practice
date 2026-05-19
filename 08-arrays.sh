#!bin/bash
#array takes all the declared names as starts from 01234 like that 
names=("varun" "modi" "venkat")

echo "the first name is ${names[0]}"
echo "the second name is ${names[3]}"
echo "the third name is ${names[1]}"
#@ represents all the names it will print all 
echo "all names ${names[@]}"
