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

install_command_with_apt() {
    com="$1"

    if ! command -v "$com" &>/dev/null; then
        echo -e "\n🔵 Start $com installation\n"
        sudo apt install "$com" -y
        echo -e "\n✅ $com - Install successfully\n"
    fi
}

install_font_wget() {
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
        sudo mv "$name_font" "$route_fonts"

    else
        echo -e "\n❌ Error: Unable to install the font\nThe link to the source does not exist or is erroneous.\n"
    fi
}

set_popos() {
    echo -e "\n✅ Update and upgrade\n"
    sudo apt update -y
    sudo apt upgrade -y

    # zsh
    install_command_with_apt "zsh"
    chsh -s "$(which zsh)" #cambio shell por default. Hay que reiniciar el sistema

    ######## oh-my-zsh ########
    # asegurarce que este wget, curl and git
    install_command_with_apt "wget"
    install_command_with_apt "curl"
    install_command_with_apt "git"
    install_command_with_apt "htop"
    install_command_with_apt "neofetch"

    echo -e "\n🎳 Installing oh-my-zsh...\n"
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
        echo -e "plugins=(git $new_plugins)" >>"$zshrc_file"
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

    if grep -qE "$pattern_theme" "$zshrc_file"; then
        sed -i -E "s/$pattern_theme/$new_conf_theme/" "$zshrc_file"
    else
        echo "$new_conf_theme" >>"$zshrc_file"
    fi

    # Meslo Nerd Font
    install_font_wget 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf'
    install_font_wget 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf'
    install_font_wget 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf'
    install_font_wget 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf'

    ###### Nuevas pruebas con gsettings ######
    default_profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
    default_profile=${default_profile:1:-1}

    gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$default_profile/ font "'MesloLGS NF 12'"

    # install tmux
    sudo apt install tmux -y

    ######## INSTALL LUNAR VIM ###########
    #git make pip node cargo
    install_command_with_apt "git"
    install_command_with_apt "make"
    install_command_with_apt "python3"
    install_command_with_apt "python3-pip"

    # node
    if ! which node &>/dev/null; then
        curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&
            sudo apt-get install -y nodejs
    fi

    # install cargo
    curl https://sh.rustup.rs -sSf | sudo sh -s -- -y

    # lazygit para mejor experiencia con git

    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit /usr/local/bin

    ###### Install Neovim v0.9.0+ ######
    # latest_version_neovimcurl=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep -o '"tag_name": ".*"' | cut -d '"' -f 4)
    latest_version_neovim=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep -o '"tag_name": ".*"' | sed 's/"tag_name": "//;s/"//')
    download_url="https://github.com/neovim/neovim/releases/download/$latest_version_neovim/nvim-linux64.tar.gz"
    path_nvim="/usr/local/bin"
    sudo curl -sL "$download_url" | sudo tar xz -C "$path_nvim"
    sudo ln -s "$path_nvim"/nvim-linux64/bin/nvim "$path_nvim"/nvim

    # bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
    LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh) <<EOF
y
y
y
EOF

    lvim +Lazy +TSUpdate

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
1 | '-macOs')
    echo "Instalación macOs"
    ;;
#PopOs
2 | '-pop')
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
