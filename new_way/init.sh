#!/bin/bash -x
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

# main

# start global variables

os="$1"

# sources
source configuration.sh
source generic_funtions.sh
source art.sh


###### MENU ######

text_menu_os() {
    echo -en "Enter the operating system of your machine:\n"
    echo -en "$os_options\n-> "
    read -r os
}

# Argument validations
if [ $# -lt "1" ]; then
    text_menu_os
fi

if [ $# -gt "1" ]; then
    echo -e "\n❌ Error: You can only write one argument or none at all.\n"
    text_menu_os
fi

case "$os" in
# Ubuntu
1 | '-ubuntu')
    echo "Instalación Ubuntu"
    set_ubuntu_or_popos "ubuntu"
    ;;
# PopOs
2 | '-pop')
    set_ubuntu_or_popos "pop_os"
    ;;
# Help
'-h')
    echo -e "$text_help"
    ;;
*)
    echo -e "\n❌ Error: The option is incorrect. (-h help)\n"
    ;;
esac
