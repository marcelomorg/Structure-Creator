#!/bin/bash

item=$(whiptail --title "Script for Created a Structure of Users, Directories and Permissions" \
    --menu "Choose an option:" \
    --fb 15 80 4 \
    "1" "Create Directory" \
    "2" "Create Group" \
    "3" "Create User" \
    "4" "Create predefined structure" \
    \
3>&1 1>&2 2>&3)

if ( $? -eq 0 ); then

    case "$item" in
        1)
            # create directory
        ;;
        2)
            #create group
        ;;
        3)
            #create user
        ;;
        4)
            #create predefined structure
        ;;
    esac
fi


    
