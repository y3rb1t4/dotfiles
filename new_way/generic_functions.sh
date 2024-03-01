#!/bin/bash

install_command_with_apt() {
    com="$1"

    if ! command -v "$com" &>/dev/null; then
        echo -e "\n🔵 Start $com installation\n"
        if sudo apt install "$com" -y; then
            echo -e "\n✅ $com - Install successfully\n"
        else
            echo -e "\n❌ Error: Unable to install the source: $com\n"
        fi
    fi
}

install_font_wget() {
    if [ $# -ne 1 ]; then
        return
    fi

    local url_font="$1"
    local name_font=$(basename "$url_font" | sed 's/%20/ /g')
    local route_fonts=$2

    if [ ! -d $route_fonts ]; then
        sudo mkdir $route_fonts
    fi

    if [ -f "$route_fonts/$name_font" ]; then
        echo "ya existe la fuente $name_font"
        return
    fi

    if wget --spider "$url_font"; then
        echo -e "\n🎨 Start font installation\n"
        wget "$url_font"
        echo "$name_font"
        sudo mv "$name_font" "$route_fonts"

    else
        echo -e "\n❌ Error: Unable to install the font\nThe link to the source does not exist or is erroneous.\n"
    fi
}

install_repository_fonts() {

    if [ $# -ne 2 ]; then
        echo -e "\n❌ Error install_repository_fonts\n"
        return
    fi

    local font_path_origin=$1
    local font_path_destination=$2

    if [ ! -d "$route_fonts" ]; then
        sudo mkdir -p "$font_path_origin"
    fi

    echo -e "\n🎨 Start font installation\n"
    sudo mv "$font_path_origin/*" "$font_path_destination"

}
