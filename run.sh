#!/bin/bash

#Save current directory so we can restore it later
cur=$PWD

#To access command line arguments use syntax ${args[1]} etc
function run {
    cd $1
    echo "$(tput setaf 2)$1$(tput sgr 0)"
    $2
    cd ..
}

#This loop will go to each immediate child and execute dir_command
find . -maxdepth 1 -type d \( ! -name . \) | while read dir; do
   run "$dir/" "$1"
done

#Restore the folder
cd "$cur"
