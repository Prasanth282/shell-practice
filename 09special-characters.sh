#!bin/bash
numbers=("1" "2" "3" "4" "5")
names=("varun" "modi" "venkat")

echo "the first name is ${names[0]}"
echo "the second name is ${names[3]}"
echo "the third name is ${names[1]}"
#@ represents all the names it will print all 
echo "all names ${names[@]}"

echo "print all the variables: $@"
echo "print all the numbers: $#"
echo "print the home directory of user: $HOME"
echo "print the current working directory: $PWD"
echo "print the current user: $USER"
echo "print the currentcommand PID: $$"
sleep 10 &
echo "print the background process PID of last nackground process: $!"
