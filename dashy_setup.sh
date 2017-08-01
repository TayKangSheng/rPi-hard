#!/bin/bash

# Default output configurations
normal=$(tput sgr0)

# Text format
fbold=$(tput bold)

# Colours for Terminal output
cblue=$(tput setaf 4)

# Print Welcome Message"
printf "%s\n" "${fbold}${cblue}Intialising Dashy Setup for Raspberry PI"

# Setting Locales
sudo dpkg-reconfigure locales
sudo dpkg-reconfigure keyboard-configuration
sudo dpkg-reconfigure tzdata


# Setting Keyboard Layout
# printf "%s\n" "${fbold}${cblue}Setting Keyboard Layout${normal}"
# sudo apt-get install -y x11-xkb-utils
# sudo dpkg-reconfigure 
# printf "\n" >> ~/.bashrc
# printf "%s\n" "setxkbmap us" >> ~/.bashrc

## Setup Vim
printf "%s\n" "${fbold}${cblue}Installing Vim${normal}"
sudo apt-get install -y vim

printf "\n" >> ~/.bashrc
printf "%s\n" "export EDITOR='vim'" >> ~/.bashrc
printf "%s\n" "export VISUAL='vim'" >> ~/.bashrc

touch ~/.vimrc
printf "\n" >> ~/.vimrc
printf "%s\n" "set number" >> ~/.vimrc

# Set up Chromium Autostart
printf "%s\n" "${fbold}${cblue}Editing autostart script${normal}"

printf "\n" >> ~/.config/lxsession/LXDE-pi/autostart
printf "%s\n" "/usr/bin/chromium-browser --test-type --no-default-browser-check --no-first-run --disable-infobars --disable-session-crashed-bubble --ignor    e-certificate-errors --start-fullscreen https://www.google.com.sg" >> ~/.config/lxsession/LXDE-pi/autostart
