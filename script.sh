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

create_tiger() {
    cat <<"EOF" >$HOME/tiger.ascii
                                ___..........__
          _,...._           _."'_,.++8n.n8898n.`"._        _....._
        .'       `".     _.'_.'" _.98n.68n. `"88n. `'.   ,"       `.
       /        .   `. ,'. "  -'" __.68`""'""=._`+8.  `.'     .     `.
      .       `   .   `.   ,d86+889" 8"""+898n, j8 9 ,"    .          \
     :     '       .,   ,d"'"   _..d88b..__ `"868' .'  . '            :
     :     .      .    _    ,n8""88":8"888."8.  "               '     :
      \     , '  , . .88" ,8P'     ,d8. _   `"8n  `.      `.   .     '
       `.  .. .     d89' "  _..n689+^'8n88n.._ `+  . `  .  , '      ,'
         `.  . , '  8'    .d88+"    j:""' `886n.    b`.  ' .' .   ."
          '       , .j            ,d'8.         `  ."8.`.   `.  ':
           .    .' n8    ,_      .f A 6.      ,..    `8b, '.   .'_
         .' _    ,88'   :8"8    6'.d`i.`b.   d8"8     688.  ".    `'
       ," .88  .d868  _         ,9:' `8.`8   "'  ` _  8+""      b   `,
     _.  d8P  d'  .d :88.     .8'`j   ;+. "     n888b 8  .     ,88.   .
    `   :68' ,8   88     `.   '   :   l `     .'   `" jb  .`   688b.   ',
   .'  .688  6P   98  =+""`.      `   '       ,-"`+"'+88b 'b.  8689  `   '
  ;  .'"888 .8;  ."+b. : `" ;               .: "' ; ,n  `8 q8, '88:       \
  .   . 898  8:  :    `.`--"8.              d8`--' '   .d'  ;8  898        '
 ,      689  9:  8._       ,68 .        .  :89    ..n88+'   89  689,' `     .
 :     ,88'  88  `+88n  -   . .           .        " _.     6:  `868     '   '
 , '  .68h.  68      `'"    . . .        .  . .             ,8'   8P'      .   .
 .      '88  'q.    _.f       .          .  .    '  .._,. .8"   .889        ,
.'     `898   _8hnd8p'  ,  . ..           . .    ._   `89,8P    j"'  _   `
\  `   .88, `q9868' ,9      ..           . .  .   8n .8 d8'   +'   n8. ,  '
 ,'    ,+"88n  `"8 .8'     . ..           . .       `8688P"   9'  ,d868'   .  .
 .      . `86b.    " .       .            ..          68'      _.698689;      :
  . '     ,889_.n8. ,  ` .   .___      ___.     .n"  `86n8b._  `8988'b      .,6
   '       q8689'`68.   . `  `:. `.__,' .:'  ,   +   +88 `"688n  `q8 q8.     88
   , .   '  "     `+8 n    .   `:.    .;'   . '    . ,89           "  `q,    `8
  .   .   ,        .    + c  ,   `:.,:"        , "   d8'               d8.    :
   . '  8n           ` , .         ::    . ' "  .  .68h.             .8'`8`.  6
    ,    8b.__. ,  .n8688b., .    .;:._     .___nn898868n.         n868b `"   8
     `.  `6889868n8898886888688898"' "+89n88898868868889'         688898b    .8
      :    q68   `""+8688898P ` " ' . ` '  ' `+688988P"          d8+8P'  `. .d8
      ,     88b.       `+88.     `   ` '     .889"'           ,.88'        .,88
       :    '988b        "88b.._  ,_      . n8p'           .d8"'      '     689
       '.     "888n._,      `"8"+88888n.8,88:`8 .     _ .n88P'   .  `      ;88'
        :8.     "q888.  .            "+888P"  "+888n,8n8'"      .  .     ,d986
        :.`8:     `88986                          `q8"           ,      :688"
        ;.  '8,      "88b .d                        '                  ,889'
        :..   `6n      '8988                                         b.89p
        :. .    '8.      `88b                                        988'
        :. .      8b       `q8.        '                     . '   .d89      '
        . .        `8:       `86n,.       " . ,        , "        ,98P      ,
        .. .         '6n.       +86b.
        ╔═╗┬─┐┌─┐┌─┐┬┌─┐┌─┐  ┌─┐┌─┐┬─┐  ┌─┐ ┬┌─┐┌─┐┬ ┬┌┬┐┌─┐┬─┐ 
        ║ ╦├┬┘├─┤│  │├─┤└─┐  ├─┘│ │├┬┘  ├┤  │├┤ │  │ │ │ ├─┤├┬┘ 
        ╚═╝┴└─┴ ┴└─┘┴┴ ┴└─┘  ┴  └─┘┴└─  └─┘└┘└─┘└─┘└─┘ ┴ ┴ ┴┴└─ 
                   ┌─┐┌─┐┌┬┐┌─┐  ┌─┐┌┐┌┌┬┐┌─┐┬─┐┌┐┌┌─┐           
                   ├┤ └─┐ │ ├┤   ├┤ │││ │ │ │├┬┘││││ │           
                   └─┘└─┘ ┴ └─┘  └─┘┘└┘ ┴ └─┘┴└─┘└┘└─┘       

🎨 Configure ZSH: (ingrese cualquier tecla)
EOF

}

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

    url_font="$1"
    name_font=$(basename "$url_font" | sed 's/%20/ /g')
    route_fonts="/usr/share/fonts/opentype/custom_fonts"

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

set_popos() {

    cd "$HOME"

    ###### UPDATE AND UPGRADE ######

    echo -e "\n✅ Update and upgrade\n"
    sudo apt update -y
    sudo apt upgrade -y

    ##### VISUAL CONFIGURATION ######

    ## Meslo Nerd Font (oh my zsh) ##
    install_font_wget 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf'
    install_font_wget 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf'
    install_font_wget 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf'
    install_font_wget 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf'

    # zsh (para que pida el otro sudo)
    install_command_with_apt "zsh"
    install_command_with_apt bash-completion
    chsh -s "$(which zsh)" #cambio shell por default. Hay que reiniciar el sistema

    ######## oh-my-zsh ########
    echo -e "\n🎳 Installing oh-my-zsh...\n"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    echo -e "\n🎷 Cloning the zsh-autosuggestions, zsh-zyntaz-higlighting, zsh-completions repo...\n"
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
    git clone https://github.com/zsh-users/zsh-completions.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-completions"

    # existe plugins=( en .zshrc ??
    # saque zsh-completions porque exegol usa bashcominit.
    new_plugins='zsh-autosuggestions zsh-syntax-highlighting colored-man-pages'
    zshrc_file="$HOME/.zshrc"
    pattern_plugins='^plugins=\(([^)]*)\)'

    echo -e "\n🟣 Update ~/.zshrc. Add plugins to zsh: $new_plugins\n"

    if grep -qE "$pattern_plugins" "$zshrc_file"; then
        echo "existe plugins"
        sed -i -E "s/$pattern_plugins/plugins=(\1 $new_plugins)/" "$zshrc_file"
    else
        echo -e "plugins=(git $new_plugins)" >>"$zshrc_file"
    fi

    # # zsh-completions
    #     if ! grep -q 'autoload -U compinit && compinit' "$zshrc_file"; then
    #         sed -i -E "/$pattern_plugins/ a autoload -U compinit && compinit" "$zshrc_file" # revisar si es posible error por sobreescribir
    #     fi

    if ! grep -q 'autoload -U bashcompinit && bashcompinit' "$zshrc_file"; then
        echo "autoload -U bashcompinit && bashcompinit" >>"$zshrc_file"
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
    ## Config Gnome-Terminal ##

    default_profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
    default_profile=${default_profile:1:-1}

    # gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$default_profile/" "font" "'MesloLGS NF 12'"
    # gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$default_profile/" "background-transparency-percent" "3"
    # gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$default_profile/" "use-theme-transparency" "false"
    # gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$default_profile/" "use-transparent-background" "true"

    cat <<-EOF | dconf load /org/gnome/terminal/
    [legacy/profiles:/:$default_profile]
    background-color='rgb(26,29,26)'
    background-transparency-percent=8
    font='MesloLGS NF 12'
    use-theme-transparency=false
    use-transparent-background=true
EOF

    route_wallpaper="$HOME/.local/share/backgrounds"
    name_wallpaper="wallpaper-custom.jpg"

    if [ ! -d $route_wallpaper ]; then
        mkdir -p $route_wallpaper
    fi

    if [ ! -f "$route_wallpaper/$name_wallpaper" ]; then
        wget https://images.hdqwalls.com/download/cyberpunk-samurai-4k-qg-1920x1080.jpg -O "$route_wallpaper/$name_wallpaper"
    fi

    gsettings set org.gnome.desktop.background picture-uri "file:///home/cosmo/.local/share/backgrounds/$name_wallpaper"
    gsettings set org.gnome.desktop.background picture-uri-dark "file:///home/cosmo/.local/share/backgrounds/$name_wallpaper"

    #Activate auto-tiling
    xdotool key Super+y
    create_tiger
    gnome-terminal -- bash -c 'cat "$HOME/tiger.ascii";read -r; exec zsh' &

    ###### PROGRAMS ######

    # asegurarce que este wget, curl and git
    install_command_with_apt wget
    install_command_with_apt curl
    install_command_with_apt git
    install_command_with_apt htop
    install_command_with_apt neofetch
    install_command_with_apt bat
    
    alias cat=$(which batcat)
    echo -e "\nalias cat=$(which batcat)\n" >> .bashrc

    # install tmux
    sudo apt install tmux -y

    ######## INSTALL LUNAR VIM ###########
    #git make pip node cargo
    install_command_with_apt git
    install_command_with_apt make
    install_command_with_apt python3
    install_command_with_apt python3-pip

    # node
    if ! which node &>/dev/null; then
        curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&
            sudo apt-get install -y nodejs
        # Resolving EACCES permissions errors
        mkdir "$HOME/.npm-global"
        npm config set prefix "$HOME/.npm-global"
        export "PATH=$HOME/.npm-global/bin:$PATH"
        echo "export PATH=$HOME/.npm-global/bin:\$PATH" >>"$HOME/.bashrc"

    fi

    # install cargo
    curl https://sh.rustup.rs -sSf | sh -s -- -y
    source "$HOME/.cargo/env"
    # Dejo de andar la instalación del manual por eso use apt.
    # if ! which cargo; then sudo apt install cargo -y; fi

    # lazygit para mejor experiencia con git

    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit /usr/local/bin
    rm lazygit.tar.gz

    ###### Install Neovim v0.9.0+ ######
    latest_version_neovim=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep -o '"tag_name": ".*"' | sed 's/"tag_name": "//;s/"//')
    download_url="https://github.com/neovim/neovim/releases/download/$latest_version_neovim/nvim-linux64.tar.gz"
    path_nvim="/usr/local/bin"
    sudo curl -sL "$download_url" | sudo tar xz -C "$path_nvim"
    sudo ln -s "$path_nvim"/nvim-linux64/bin/nvim "$path_nvim"/nvim

    LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh) <<-EOF
    y
    y
    y
EOF

    export "PATH=$HOME/.local/bin:$PATH"
    echo "export \"PATH=$HOME/.local/bin:\$PATH\"" >>"$HOME/.bashrc"

    if ! echo "$PATH" | grep '.cargo/bin:'; then
        export "PATH=/home/cosmo/.cargo/bin:$PATH"
        echo "export \"PATH=$HOME/.cargo/bin:\$PATH\"" >>"$HOME/.bashrc"
    fi

    lvim +TSUpdate +qall

    # install docker

    # Add Docker's official GPG key:
    sudo apt-get update
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |
        sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

    sudo groupadd docker

    # add the sudo group to the user
    sudo usermod -aG docker "$(id -u -n)"

    # "reload" the user groups with the newly added docker group
    # ESTE COMANDO TRAE PROBLEMAS PORQUE ABRE OTRO BASH.
    #newgrp docker

    # install lsd

    cargo install lsd

    # install exegol
    git clone "https://github.com/ThePorgs/Exegol"

    install_command_with_apt python3-argcomplete
    
    sudo python3 -m pip install --requirement "Exegol/requirements.txt"
    sudo ln -s "$(pwd)/Exegol/exegol.py" "/usr/local/bin/exegol"
    register-python-argcomplete --no-defaults exegol | sudo tee /etc/bash_completion.d/exegol >/dev/null

    sudo exegol install

    # alacritty 0.12.2
    #sudo apt install alacritty


    ####### Config Theme #######
    echo -e "\n⚠ Si ya configuro zsh presione enter - sino termine de configurar\n"
    read -r

    echo -e "\nalias cat=$(which batcat)\n" >> "$HOME/.zshrc"

    # lsd
    echo -e "\n alias ls=lsd"

    #node
        echo "export PATH=$HOME/.npm-global/bin:\$PATH" >>"$HOME/.zshrc"
    #lvim
        echo "export \"PATH=$HOME/.local/bin:\$PATH\"" >>"$HOME/.zshrc"
    #cargo
    if ! echo "$PATH" | grep '.cargo/bin:' &> /dev/null ; then
        echo "export \"PATH=$HOME/.cargo/bin:\$PATH\"" >>"$HOME/.zshrc"
    fi
    # exegol
    echo 'eval "$(register-python-argcomplete --no-defaults exegol)"' >>"$HOME/.zshrc"

    echo -e "\n✅✅✅ INSTALACIÓN FINALIZADA: REINICIE EL EQUIPO ✅✅✅\n"

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
