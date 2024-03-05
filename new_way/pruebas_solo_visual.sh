#!/bin/bash
set -o errexit
set -o pipefail
# set -o nounset
set -o xtrace

source configuration.sh
source art.sh
source generic_functions.sh
source init.sh

install_repository_fonts "$origin_fonts" "$default_font_installation_path"

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

    #install_command_with_apt fonts-powerline
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

    theme='powerlevel10k\/powerlevel10k'
    pattern_theme='^ZSH_THEME=\"[^\"]*\"'
    new_conf_theme="ZSH_THEME=\"$theme\""

    if grep -qE "$pattern_theme" "$zshrc_file"; then
        sed -i -E "s/$pattern_theme/$new_conf_theme/" "$zshrc_file"
    else
        echo "$new_conf_theme" >>"$zshrc_file"
    fi
