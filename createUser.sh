#!/bin/bash

inputChoise=$(whiptail --title "Script for Created a Structure of Users, Directories and Permissions" \
    --inputbox "Enter user name:" \
    --fb 10 80 \
3>&2 2>&1 1>&3)
validInputChoise=$?

if [ $validInputChoise -eq 0 ]; then

    whiptail --title "Script for Created a Structure of Users, Directories and Permissions" \
        --yesno "$inputChoise will belongs to some group?" \
        --yes-button "Yes" --no-button "No" \
        --fb 10 80 \
    3>&2 2>&1 1>&3
    inputYesOrNo=$?

    if [ $inputYesOrNo -eq 0 ]; then
        inputGroup=$(whiptail --title "Script for Created a Structure of Users, Directories and Permissions" \
            --inputbox "Enter the name of the group that belongs to user $inputChoise" \
            --fb 10 80 \
        3>&2 2>&1 1>&3)
    fi
fi

if [ $validInputChoise -eq 0 ]; then
    inputPassword=$(whiptail --title "Script for Created a Structure of Users, Directories and Permissions" \
        --passwordbox "Enter your password for confirm user create:" \
        --fb 10 80 \
    3>&2 2>&1 1>&3)
fi

if [ $? -eq 0 -a $validInputChoise -eq 0 ]; then
    if [ $inputYesOrNo -eq 0 ]; then
        echo -e "$inputPassword\n" | sudo -S useradd  -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G $inputGroup $inputChoise
    elif [ $inputYesOrNo -eq 1 ]; then
        echo -e "$inputPassword\n" | sudo -S useradd  -m -s /bin/bash -p $(openssl passwd -1 Senha123) $inputChoise
    fi
fi

if [ $? -eq 0 -a $validInputChoise -eq 0 ]; then
    ./warning.sh "User '$inputChoise' sucessfully created"
else
    ./warning.sh "Sorry, user was not created"
fi
./install.sh