#!/bin/bash

inputChoise=$(whiptail --title "Script for Created a Structure of Users, Directories and Permissions" \
    --inputbox "Enter directory name:" \
    --fb 10 80 \
3>&1 1>&2 2>&3)
validInputChoise=$?

if [ $validInputChoise -eq 0 ]; then
    inputPassword=$(whiptail --title "Script for Created a Structure of Users, Directories and Permissions" \
        --passwordbox "Enter your password:" \
        --fb 10 80 \
    3>&1 1>&2 2>&3)
fi

if [ $? -eq 0 -a $validInputChoise -eq 0 ]; then
    echo -e "$inputPassword\n" | sudo -S mkdir /$inputChoise > /dev/null 2>&1
    if [ $? -eq 0 ]; then 
        ./Models/warning.sh "Directory '/$inputChoise' sucessfully created"
    else
        ./Models/warning.sh "Sorry, directory was not created"
    fi
fi
./install.sh
