
#!/bin/bash

# start of texts to print
os_options='[1] macOs
[2] PopOs'

text_help="Arguments: \n$os_options"

# start functions
select_os() {
    echo -en "Enter the operating system of your machine:\n"
    echo -en "$os_options\n-> "
    read -r "os"
}

install_command_with_apt(){
    com="$1"

    if ! command -v "$com" &> /dev/null; then
        echo -e "\n🔵 Start $com installation\n"
        sudo apt install "$com" -y
        echo -e "\n✅ $com - Install successfully\n"
    fi
}


install_font_wget(){
    if [ $# -ne 1 ]; then
        return
    fi

    url_font="$1"
    name_font=$(basename "$url_font" | sed 's/%20/ /g')
    route_fonts="/usr/share/fonts/opentype/custom_fonts"

    if [ ! -d $route_fonts ]; then
        sudo mkdir $route_fonts
    fi

    if wget --spider "$url_font"; then
        echo -e "\n🎨 Start font installation\n"
        wget "$url_font"
        echo "$name_font"
        sudo mv  "$name_font" "$route_fonts"
        
    else 
        echo -e "\n❌ Error: Unable to install the font\nThe link to the source does not exist or is erroneous.\n" 
    fi
}



# create_new_profile() {
    
#     sudo apt install uuid-runtime

#     dconfdir='/org/gnome/terminal/legacy/profiles:'
#     local profile_ids=$(dconf list $dconfdir/ | grep ^: | sed 's/\///g' | sed 's/://g')
#     local profile_name="$1"
#     local profile_ids_old="$(dconf read "$dconfdir"/list | tr -d "]")"
#     local profile_id="$(uuidgen)"

#     [ -z "$profile_ids_old" ] && local profile_ids_old="["  # if there's no `list` key
#     [ ${#profile_ids[@]} -gt 0 ] && local delimiter=,  # if the list is empty
#     dconf write $dconfdir/list \
#         "${profile_ids_old}${delimiter} '$profile_id']"
#     dconf write "$dconfdir/:$profile_id"/visible-name "'$profile_name'"
#     echo $profile_id
# }





set_popos() {
    echo -e "\n✅ Update and upgrade\n"
    sudo apt update -y
    sudo apt upgrade -y


    # zsh
    install_command_with_apt "zsh"
        # sudo apt install zsh-doc -y #doc
        # touch ~/.zshrc
     chsh -s "$(which zsh)" #cambio shell por default. Hay que reiniciar el sistema

    ######## oh-my-zsh ########
    # asegurarce que este wget, curl and git
    install_command_with_apt "wget"
    install_command_with_apt "curl"
    install_command_with_apt "git"

    echo -e "\n🎳 Installing oh-my-zsh...\n"
    # sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    echo -e "\n🎷 Cloning the zsh-autosuggestions, zsh-zyntaz-higlighting, zsh-completions repo...\n"
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
    git clone https://github.com/zsh-users/zsh-completions.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-completions"

    # existe plugins=( en .zshrc ??
    new_plugins='zsh-autosuggestions zsh-syntax-highlighting zsh-completions colored-man-pages'
    zshrc_file="$HOME/.zshrc"
    pattern_plugins='^plugins=\(([^)]*)\)'

    echo -e "\n🟣 Update ~/.zshrc. Add plugins to zsh: $new_plugins\n"

    if grep -qE "$pattern_plugins" "$zshrc_file"; then
        echo "existe plugins"
        sed -i -E "s/$pattern_plugins/plugins=(\1 $new_plugins)/" "$zshrc_file"
    else
        echo -e "plugins=(git $new_plugins)" >> "$zshrc_file"
    fi

    if grep -q 'autoload -U compinit && compinit' "$zshrc_file"; then
        sed -i -E "/$pattern_plugins/ a autoload -U compinit && compinit" "$zshrc_file" # revisar si es posible error por sobreescribir
    fi

    # Instalar Nerd Fonts o Powerline()
    # Tema interesante agnoster

    install_command_with_apt fonts-powerline
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

    theme='powerlevel10k\/powerlevel10k'
    pattern_theme='^ZSH_THEME=\"[^\"]*\"'
    new_conf_theme="ZSH_THEME=\"$theme\""

    if grep -qE  "$pattern_theme" "$zshrc_file"; then
        sed -i -E "s/$pattern_theme/$new_conf_theme/" "$zshrc_file"
    else
        echo "$new_conf_theme" >> "$zshrc_file"
    fi

    # Meslo Nerd Font
    install_font_wget 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf'
    install_font_wget 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf'
    install_font_wget 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf'
    install_font_wget 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf'
    
    #fc-cache -fv
    # fc-list | grep 'MesloLGS NF'


    ### NO tiene dconf /org/gnome/terminal/legacy/profiles:/ cuando no interactuaste con las preferencias de consola.
    ### Por ende trate de crear un perfil para editar su fuente despues pero rompe.
    ### El gsettings cambia las fuentes del desktop pero no de la terminal.
    # no estoy pudiendo cambiar la fuente de la terminal gnome-terminal (REVISAR)
    # change font gnome-shell

    #gsettings set org.gnome.desktop.interface font-name 'MesloLGS NF'
    # gsettings get org.gnome.Terminal.Legacy.Profile:/
    # route_gnome_terminal_profile='/org/gnome/terminal/legacy/profiles:/'
    # echo "revisar antes"
    # aux=""

    # ## PRUEBAAS
    # id=$(create_new_profile TEST)
    # echo "El id es $id"

#     read -r "aux"
#     gnome_terminal_profile=$(dconf list "$route_gnome_terminal_profile" | grep -E ':[^-]*-[^-]*-[^-]*-[^-]*-[^/]*/')
#     echo "$gnome_terminal_profile"
#     dconf list $route_gnome_terminal_profile
#     echo "/org/gnome/terminal/legacy/profiles:/""$gnome_terminal_profile""font" "'MesloLGS NF 12'"

#     read -r "aux"
#     dconf write "/org/gnome/terminal/legacy/profiles:/""$gnome_terminal_profile""font" "'MesloLGS NF 12'"


    # dconf reset -f /

    # install tmux
    sudo apt install tmux -y

    # install vim

    # install lunar-vim

    # install docker

    # install exegol
}

# main

# start global variables
os="$1"

# argument validations
if [ $# -lt "1" ]; then
    select_os
fi

if [ $# -gt "1" ]; then
    echo -e "\n❌ Error: You can only write one argument or none at all.\n"
    select_os
fi

case "$os" in
    #macOs
    1|'-macOs')
        echo "Instalación macOs"
        ;;
    #PopOs
    2|'-pop')
        set_popos
        ;;
    '-h')
        echo -e "$text_help"
        ;;
    *)
        echo default
        echo -e "\n❌ Error: The option is incorrect. (-h help)\n"
        ;;
esac
