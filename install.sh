#!/bin/bash

item=$(whiptail --title "Script for Created a Structure of Users, Directories and Permissions" --backtitle "(use <tab> for 'ok' or 'exit')" \
    --menu "Choose an option:" \
    --cancel-button "Exit" \
    --fb 15 80 4 \
    "1" "Create Directory" \
    "2" "Create Group" \
    "3" "Create User" \
    "4" "Create predefined structure" \
    \
3>&1 1>&2 2>&3)

if [ $? -eq 0 ]; then

    case "$item" in
        1)
            ./Services/createDirectory.sh
        ;;
        2)
            ./Services/createGroup.sh
        ;;
        3)
            ./Services/createUser.sh
        ;;
        4)
            #create predefined structure
        ;;
    esac
fi          