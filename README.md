# dotfiles

My custom Arch dotfiles.

## zshrc

I'm using zsh as main shell with [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
This configuration includes custom functions to do some bug bounty stuff and uses
[tmux](https://github.com/tmux/tmux) for terminal multiplexing.

## Tmux

I use tmux with `CTRL+a` as prefix key. I also use
[TPM](https://github.com/tmux-plugins/tpm) for package management.
There's only one plugin in my configuration [Vim tmux navigator](https://github.com/christoomey/vim-tmux-navigator).
I use this plugin in both tmux and Neovim to navigate between panes and splits.

## hyprland

I love tiling window managers, and [hyprland](https://github.com/hyprwm/Hyprland)
is my current choice. It's pretty much the default configuration with some
custom keybindings.

## Kitty

It really doesn't matter which terminal emulator you use. I use the default
configuration with one of the predefined themes.

## Neovim (LazyVim)

I'm using Neovim with LazyVim as IDE. Some additional stuff that includes:

### [CopilotChat](https://github.com/CopilotC-Nvim/CopilotChat.nvim)

Copilot integration with custom system prompt and predefined prompts for quick
actions like explain, refactor or document code.

### [LazyGit](https://github.com/kdheepak/lazygit.nvim)

LazyGit integration for git management inside Neovim. It requires
[lazygit](https://github.com/jesseduffield/lazygit) to be installed.

### [Oil](https://github.com/stevearc/oil.nvim)

Instead of using the default file explorer, I use oil, that allows to handle
files as if we were editing them in a buffer.

### [Vim tmux navigator](https://github.com/christoomey/vim-tmux-navigator)

As I've mentioned before, I use this plugin to navigate between tmux and Neovim
panes and splits.

## [Waybar](https://github.com/Alexays/Waybar)

I use waybar mainly to show workspaces and system information. There's only one
custom module (might add more in the future).

### Youtube module

I was following a long tutorial on Youtube and I just wanted to save the exact
minute where I left it. That's exactly why I've created this module.

Actually, it just saves anything you have on your clipboard to a file
(right-click on the module icon) and then tries to open it using Firefox
(left-click on the module icon), which means you can save any link and open
it later.

## [Wofi](https://github.com/SimplyCEO/wofi)

I use wofi as application launcher running in "command" mode with custom styling.
