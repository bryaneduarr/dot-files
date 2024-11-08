# Neovim configuration file

This repository contains configuration about [neovim](https://neovim.io/), using the [lazy.nvim](https://github.com/folke/lazy.nvim) plugin manager and [tmux](https://github.com/tmux/tmux).

## Setup

This configuration was done using **WSL** with an **Ubuntu 24.04.01 LTS** image.

It uses **Windows Terminal** and [CaskaydiaCove Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CascadiaCode.zip) for the **Nerd Font**.

## Dependencies needed

Use [Homebrew](https://brew.sh/) to easily install the packages. The following packages are required to run this configuration:
```bash
brew install git ripgrep gcc fzf ripgrep fd node lazygit tmux nvim
```

Install the [tmux plugin manager](https://github.com/tmux-plugins/tpm), needed for customization in the **.tmux.conf** file:
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Install a clipboard manager using **apt install** (Only required for pasting images with [obsidian.nvim](https://github.com/epwalsh/obsidian.nvim)):
```bash
sudo apt install xclip
```

## Install yarn

We need to isntall yarn for the compatibility for the plugin [Markdown Preview](https://github.com/iamcco/markdown-preview.nvim).

```bash
npm install -g yarn
```

## ENV file

There is an **env** file located in _~/.config/nvim/.env_, this **env** file contains the following variables:
```Typescript
OBSIDIAN_NOTES=path/here // Path of your obsidian vault.
```
