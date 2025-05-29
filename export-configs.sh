#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <path_to_dotfiles_directory>"
  exit 1
fi

DOTFILES_DIR=$1

# Move all config files to the specified directory
cp ~/.tmux.conf $DOTFILES_DIR/.tmux.conf
cp ~/.zshrc $DOTFILES_DIR/.zshrc
cp -R ~/.config/hypr/* $DOTFILES_DIR/hypr/
cp -R ~/.config/kitty/* $DOTFILES_DIR/kitty/
cp -R ~/.config/nvim/* $DOTFILES_DIR/nvim/
cp -R ~/.config/waybar/* $DOTFILES_DIR/waybar/
cp -R ~/.config/wofi/* $DOTFILES_DIR/wofi/

# Remove H1_API
sed -E -i "s/H1_API=(.*)/H1_API='YOUR_H1_API_KEY'/" $DOTFILES_DIR/.zshrc
