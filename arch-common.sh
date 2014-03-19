#!/bin/bash

function ask_yesno() {
    if [[ -n $1 ]]; then
        echo -n $1" "
    fi

    read -p "[yes/no] " YESNO
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
    read -p "Press ENTER to continue."
}

function export_lang()
{
    echo "Set your LANG variable. Usually it's same as your locale."
    read -p "LANG=" LANG
    export LANG
}

function edit_locale_gen()
{
    edit_pause "Edit your locale.conf file now."

    nano /etc/locale.gen
    locale-gen
}

function arch_term()
{
    loadkeys us
    setfont Lat2-Terminus16

    ask_yesno "Would you like me to edit your locale?" && export_lang && 
    echo "Test internet connectivity"
    ping -c3 www.google.com

    ask_yesno "Was the ping successful?" || exit 1
}