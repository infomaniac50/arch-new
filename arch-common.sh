#!/bin/bash

function ask_yesno() {
    if [[ $YESNO == 'yes' || $YESNO == 'y' || $YESNO == 'Y' || $YESNO == 'YES' ]]; then 
        echo ":)"
        return 0
    else
        echo ":("
        return 1
    fi
}

function edit_pause() {
    if [[ -n $1 ]]; then
        echo -n $1" "
    fi

    echo "Press ENTER to continue."
    read
}

function arch_term()
{
    loadkeys us
    setfont Lat2-Terminus16

    edit_pause "Edit your locale.conf file now."

    nano /etc/locale.gen
    locale-gen

    echo "Set your LANG variable. Usually the same as your locale."
    read LANG
    export LANG

    echo "Test internet connectivity"
    ping -c3 www.google.com

    echo "Was the ping successful? [yes/no]"
    read YESNO

    ask_yesno || exit 1
}