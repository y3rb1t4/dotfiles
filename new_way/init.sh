#!/bin/bash -x
set -o errexit
set -o pipefail
# set -o nounset
set -o xtrace

# sources
source configuration.sh
source generic_functions.sh
source art.sh
source set_ubuntu_or_popos.sh

os="$1"

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

main (){
# main




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
}

main os