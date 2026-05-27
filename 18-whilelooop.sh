#!/bin/bash

# if we want to read a line by line in a file 

while IFS read -r line
do 
  echo" $line"
done < catalogue.log