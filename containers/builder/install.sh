#!/bin/sh

echo "Installing $1"

if ! command -v yay &> /dev/null
then
    if ! command -v sudo &> /dev/null
    then
        pacman --noconfirm -S $@
    else
        sudo pacman --noconfirm -S $@
    fi
else
    su build -c "yay --noconfirm -S $@"
fi