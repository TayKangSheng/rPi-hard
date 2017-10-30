#!/bin/bash

# Default output configurations
normal=$(tput sgr0)
# Text format
fbold=$(tput bold)
# Colours for terminal output
cblue=$(tput setaf 4)

# dashprint helper function for colours and output formatting
function dashprint() {
  if [[ "$2" = "special"]]; then
    printf "%s\n" "${fbold}${cblue}""$1"
  else
    printf "%s\n" "${fbold}${cblue}""$1""${normal}"
  fi
}

dashprint "Initialising Dashy Setup for Raspberry PI" "special"

dashprint "Setting Locales" "special"
# TODO: Directly set values
sudo dpkg-reconfigure locales
sudo dpkg-reconfigure keyboard-configuration
sudo dpkg-reconfigure tzdata

# Setting Keyboard Layout
# printf "%s\n" "${fbold}${cblue}Setting Keyboard Layout${normal}"
# sudo apt-get install -y x11-xkb-utils
# sudo dpkg-reconfigure
# printf "\n" >> ~/.bashrc
# printf "%s\n" "setxkbmap us" >> ~/.bashrc

# Install Dashy Base Packages
dashprint "Install dashy base packages" "special"
sudo apt-get update
dashy_base_packages=(chromium-browser x11-xserver-utils unclutter vim)
for i in "${dashy_base_packages[@]}"
do
  dashprint "Installing ${i}"
  sudo apt-get install --no-install-recommends --yes $i
done

## Setup Vim
dashprint "Installing Vim"
sudo apt-get install -y vim

printf "\n" >> ~/.bashrc
printf "%s\n" "export EDITOR='vim'" >> ~/.bashrc
printf "%s\n" "export VISUAL='vim'" >> ~/.bashrc

touch ~/.vimrc
printf "\n" >> ~/.vimrc
printf "%s\n" "set number" >> ~/.vimrc

# Set up Chromium Autostart
dashprint "Editing autostart script"

printf "\n" >> ~/.config/lxsession/LXDE-pi/autostart
printf "%s\n" "/usr/bin/chromium-browser --test-type --no-default-browser-check --no-first-run --disable-infobars --disable-session-crashed-bubble --ignore-certificate-errors --start-fullscreen https://www.google.com.sg" >> ~/.config/lxsession/LXDE-pi/autostart
