#!/bin/bash

# Install script to setup my needed packages after a fresh arch install, expects base-devel installed

echo pacman -S sudo yay
pacman -S yay

echo # Network
echo yay -S wpa_supplicant networkmanager network-manager-applet 
yay -S wpa_supplicant networkmanager network-manager-applet 

echo # Xorg
echo yay -S xorg-server xorg-xinit xorg-xrandr arandr xorg-xbacklight xorg-xev feh
yay -S xorg-server xorg-xinit xorg-xrandr arandr xorg-xbacklight xorg-xev feh

echo # Sound
echo yay -S pulseaudio pulseaudio-alsa pulseaudio-bluetooth pavucontrol
yay -S pulseaudio pulseaudio-alsa pulseaudio-bluetooth pavucontrol

echo # Bluetooth
echo yay -S bluez bluez-utils blueman
yay -S bluez bluez-utils blueman

echo # Desktop env
echo yay -S i3 dmenu udisks2 udiskie 
yay -S i3 dmenu udisks2 udiskie 

echo # Shell
echo yay -S rxvt-unicode oh-my-zsh zsh-theme-powerlevel9k
yay -S rxvt-unicode oh-my-zsh zsh-theme-powerlevel9k

echo # File browser
echo yay -S pcmanfm
yay -S pcmanfm

echo # Vim
echo yay -S neovim
yay -S neovim

echo # Fonts
echo # TODO: find a way to only install needed fonts and not all
echo yay -S nerd-fonts-complete
yay -S nerd-fonts-complete

echo # Stow
echo yay -S stow
yay -S stow

echo # Utils
echo yay -S trash-cli htop
yay -S trash-cli htop

echo # Media
echo yay -S vlc thunderbird opera-developer chromium chromium-widevine dropbox
yay -S vlc thunderbird opera-developer chromium chromium-widevine dropbox

