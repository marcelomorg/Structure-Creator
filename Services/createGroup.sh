#!/bin/bash

inputChoise=$(whiptail --title "Script for Created a Structure of Users, Directories and Permissions" \
    --inputbox "Enter Group name:" \
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
    echo -e "$inputPassword\n" | sudo -S groupadd $inputChoise > /dev/null 2>&1
    if [ $? -eq 0 ]; then 
        ./Models/warning.sh "Group '$inputChoise' sucessfully created"
    else
        ./Models/warning.sh "Sorry, group was not created"
    fi
fi
./install.sh