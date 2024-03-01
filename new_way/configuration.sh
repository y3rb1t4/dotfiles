#!/bin/bash


route_ascii="./ascii"
origin_fonts="./fonts"
default_font_installation_path="/usr/share/fonts/custom_fonts"

#### ART ####

# Write ascii art path

ascii_firs_cover="$route_ascii/firs_cover.ascii"

ascii_before_zsh="$route_ascii/tiger.ascii"

ascii_final_cover="$route_ascii/final_cover.ascii"



#### MESSAGES ####

# note: all messages accept C. notation (echo -e)
# start of texts to print

os_options='[1] Ubuntu
[2] PopOs'

text_help="Arguments: \n$os_options\n"


# Type the message shown before the zsh configuration
zsh_confugration_message="\n🎨 Configure ZSH: (ingrese cualquier tecla)\n"

final_message="\n✅✅✅ INSTALACIÓN FINALIZADA: REINICIE EL EQUIPO ✅✅✅\n"
