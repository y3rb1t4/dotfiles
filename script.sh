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
        echo -e "\n🔵 Start wget installation\n"
        sudo apt install "$com" -y
        echo -e "\n✅ $com - Install successfully\n"
    fi
}

set_popos() {

    echo -e "\n✅ Update and upgrade\n"
    sudo apt update -y
    sudo apt upgrade -y


    # zsh
    install_command_with_apt "zsh"
        # sudo apt install zsh-doc -y #doc
        # touch ~/.zshrc
        # chsh -s $(which zsh) #cambio shell por default. Hay que reiniciar el sistema

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
    new_plugins='zsh-autosuggestions zsh-syntax-highlighting zsh-completions'
    zshrc_file="$HOME/.zshrc"
    pattern='^plugins=\(([^)]*)\)'

    echo -e "\n🟣 Update ~/.zshrc. Add plugins to zsh: zsh-autosuggestions, zsh-zyntaz-higlighting, zsh-completions\n"

    if grep -qE "$pattern" "$zshrc_file"; then
        echo "existe plugins"
        sed -i -E "s/$pattern/plugins=(\1 $new_plugins)/" "$zshrc_file"
    else
        echo -e 'plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions)' >> ~./zshrc
    fi

    if grep -q 'autoload -U compinit && compinit' "$zshrc_file"; then
        sed -i -E "/$pattern/ a autoload -U compinit && compinit" # revisar si es posible error por sobreescribir
    fi
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
