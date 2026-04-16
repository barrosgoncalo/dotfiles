# dotfiles

My personal macOS development environment configuration files for WezTerm, Neovim, and Zsh.

## Structure

\```
~/.dotfiles/
├── wezterm/
│   └── wezterm.lua
├── nvim/
│   └── ...
└── zsh/
    └── .zshrc
\```

## Requirements

Install dependencies with Homebrew:

\```bash
brew install neovim neofetch
brew install --cask wezterm
\```

## Install

\```bash
git clone https://github.com/youruser/dotfiles ~/.dotfiles
cd ~/.dotfiles

mkdir -p ~/.config/wezterm ~/.config/nvim

ln -s ~/.dotfiles/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
\```
