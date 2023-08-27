#!/bin/bash

ls ./Assets/ > temporaryData.txt
pathFile="./temporaryData.txt"
counter=0
while IFS= read -r line || [[ -n "$line" ]]; do
    file[$counter]=$line
    ((counter++))
done < "$pathFile"

item=$(whiptail --title "Script for Created a Structure of Users, Directories and Permissions" \
    --radiolist "What list of commands do you want to run?" --fb 15 80 ${#file[@]} \
    "${file[0]}" "" OFF \
    "${file[1]}" "" ON \
    "${file[2]}" "" OFF \
    "${file[3]}" "" OFF \
    "${file[4]}" "" OFF \
    "${file[5]}" "" OFF \
    "${file[6]}" "" OFF \
    "${file[7]}" "" OFF \
    "${file[8]}" "" OFF \
    "${file[9]}" "" OFF \
3>&1 1>&2 2>&3)

validInputChoise=$?
rm temporaryData.txt
selectFile=$item

if [ $validInputChoise -eq 0 ]; then
    ./Models/warning.sh "Do you choosed: $selectFile";
fi

if [ $validInputChoise -eq 0 ]; then
    inputPassword=$(whiptail --title "Script for Created a Structure of Users, Directories and Permissions" \
        --passwordbox "Enter your user password:" \
        --fb 10 80 \
    3>&1 1>&2 2>&3)

    while IFS= read -r line || [[ -n "$line" ]]; do
        if [ $(echo -n "$inputPassword" | wc -c) -gt 2 ]; then
            echo "$line" >> temporaryData.txt
            echo -e "$inputPassword" | sudo -S $line >> temporaryData.txt 2>&1
        elif [ $(echo -n "$inputPassword" | wc -c) -lt 2 ]; then 
            echo "$line" >> temporaryData.txt
            $line >> temporaryData.txt 2>&1
        fi
    done < "./Assets/$selectFile"

    whiptail --title "The commands below were executed" \
        --textbox temporaryData.txt  \
        --fb 20 80 \
        --scrolltext \
    3>&1 1>&2 2>&3
    rm temporaryData.txt

    if [ $? -eq 0 -a $validInputChoise -eq 0 ]; then
        ./Models/warning.sh "Comands executed successfully."
    else 
        ./Models/warning.sh "Sorry, commandos not executed."
    fi
fi
./install.sh