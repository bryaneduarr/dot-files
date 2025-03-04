# Dot Files

This repository contains personal configuration for **Dot Files** including:

- [CaskaydiaCove Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CascadiaCode.zip)
- [Homebrew](https://brew.sh/)
- [NeoVim](https://neovim.io/) using the **Plugin Manager**: [lazy.nvim](https://github.com/folke/lazy.nvim)
- [Nushell](https://www.nushell.sh/)
- [Tmux](https://github.com/tmux/tmux)
- [Windows Terminal](https://github.com/microsoft/terminal)
- [WSL](https://learn.microsoft.com/en-us/windows/wsl/install)

Clone this configuration by using the following command in your `$HOME` directory:

```bash
git clone https://github.com/bryaneduarr/nvim-config.git .
```

## Setup

This configuration was done using [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) with [Ubuntu 24.04 LTS](https://ubuntu.com/blog/tag/ubuntu-24-04-lts) image.

## Terminal

The terminal used is [Windows Terminal](https://github.com/microsoft/terminal). With just basic configuration not included in this repo, mainly colors.

## Font

The font used across all this environment is: [CaskaydiaCove Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CascadiaCode.zip). You can install this font if you are in the operating systems: [MacOS](https://en.wikipedia.org/wiki/MacOS)/[Linux Distribution](https://en.wikipedia.org/wiki/Linux) by using [Homebrew](https://brew.sh/):

```bash
brew install --cask font-caskaydia-cove-nerd-font
```

## Nushell

Recommended to use [Nushell](https://www.nushell.sh/) as the default **Shell** (this step can be ignored if not wanted).

Install [Nushell](https://www.nushell.sh/) by running the following commands:

```bash
curl -fsSL https://apt.fury.io/nushell/gpg.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/fury-nushell.gpg
echo "deb https://apt.fury.io/nushell/ /" | sudo tee /etc/apt/sources.list.d/fury.list
sudo apt update
sudo apt install nushell
```

To make the [Nushell](https://www.nushell.sh/) the default shell identify which is the path of [Nushell](https://www.nushell.sh/) by running the following command:

```bash
which nu
```

Add [Nushell](https://www.nushell.sh/) to the default shells path, you need to paste the path given by the previous command `which nu` instead of the one given.

The following command will be a _default_ command if the path is the same as in the environment tested:

```bash
sudo echo "/home/linuxbrew/.linuxbrew/bin/nu" | sudo tee -a /etc/shells
```

To change to [Nushell](https://www.nushell.sh/) as the default shell run the following command using the path that `which nu` give you:

```bash
chsh -s /home/linuxbrew/.linuxbrew/bin/nu
```

_The default installation can be found [here](https://www.nushell.sh/book/installation.html)._

**RESTART YOUR TERMINAL AFTER CHANGING**

## Environment

This setup was made using [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) with [Ubuntu 24.04 LTS](https://ubuntu.com/blog/tag/ubuntu-24-04-lts) image and it needs some dependencies to run some packages that are required in this configuration.

First ensure your system is up to date with the following using the following commands:

```bash
sudo apt update && sudo apt upgrade -y && sudo apt install build-essential -y
```

Install [Python](https://www.python.org/) v.3.12-venv

```bash
sudo apt install python3.12-venv -y
```

## Homebrew

For the installation of [Homebrew](https://brew.sh/) we will follow the recommended installation from their [installation instructions](https://docs.brew.sh/Installation).

To install [Homebrew](https://brew.sh/) use the following command:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Once the installation is finished add the path to your **Shell** using the following command:

```bash
echo >> /home/user/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/user/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

Update your packages after installation (OPTIONAL):

```bash
sudo apt update && sudo apt upgrade -y && sudo apt install build-essential -y
```

Or using [Nushell](https://www.nushell.sh/):

```sh
sudo apt update ;sudo apt upgrade -y ; sudo apt install build-essential -y
```

## Brew Packages

For the installation all the packages needed for this configuration we will be using [Homebrew](https://brew.sh/) to install them, you can just copy and paste the following command that includes all the dependencies:

```bash
brew install fd fzf git gcc luarocks nvim ripgrep tmux unzip
```

## NVM

This configuration will be using [NVM](https://github.com/nvm-sh/nvm) for managing [Node.JS](https://nodejs.org/en) and [NPM](https://www.npmjs.com/).

Install [NVM](https://github.com/nvm-sh/nvm) by using the following command:

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
```

**RESTART YOUR TERMINAL AFTER INSTALLATION FINISHES**

## TPM

By using [Tmux](https://github.com/tmux/tmux) this configuration also includes some plugins managed by [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm). You can find the configuration for all [Tmux](https://github.com/tmux/tmux) related configuration in this repository [here](./.tmux.conf).

To install [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) use the following command:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Install the plugins by using `PREFIX` (in this configuration `CTRL+S`) + I. Follow the instructions from their repository [here](https://github.com/tmux-plugins/tpm#key-bindings).

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Spell Check

If you plan to use a spell check in Spanish please follow the following instructions:

1. Create a new file in `~/.config/nvim/` named `spell`:

```bash
mkdir ~/.config/nvim/spell
```

2. Enter the new file created:

```bash
cd ~/.config/nvim/spell
```

Install the packages for spell checkers with the following commands:

```bash
wget https://ftp.nluug.nl/pub/vim/runtime/spell/es.utf-8.spl
wget https://ftp.nluug.nl/pub/vim/runtime/spell/es.utf-8.sug
```

## obsidian.nvim

If you are planning in using [epwalsh/obsidian.nvim](https://github.com/epwalsh/obsidian.nvim) you will need to create a new folder anywhere you want, for example:

```bash
mkdir ~/notes
```

Inside `~/.config/nvim/` you will need to add a `.env` file that includes the path for where you decided to create your _Obsidian Vault_. You can do this by following this steps:

1. Create a new `.env` file:

```bash
nvim ~/.config/nvim/.env
```

2. Add this inside the `.env` file:

```env
OBSIDIAN_NOTES=/path/to/your/vault
```

Another plugin that uses the `.env` file is [nvim-telescope/telescope](https://github.com/nvim-telescope/telescope.nvim) it is used to ignore not necessary files when you use this plugin. You can customize it as you desire to ignore certain type of files in [here](./.config/nvim/lua/plugins/telescope.lua).

## Plugins used

| Plugin                                    | GitHub Link                                                            | Local Config                                                   |
| ----------------------------------------- | ---------------------------------------------------------------------- | -------------------------------------------------------------- |
| antosha417/nvim-lsp-file-operations       | [GitHub](https://github.com/antosha417/nvim-lsp-file-operations)       | [Config File](./.config/nvim/lua/plugins/lsp.lua)              |
| catppuccin/nvim                           | [GitHub](https://github.com/catppuccin/nvim)                           | [Config File](./.config/nvim/lua/plugins/colorschemes.lua)     |
| codeium.nvim                              | [GitHub](https://github.com/Exafunction/codeium.nvim)                  | [Config File](./.config/nvim/lua/plugins/codeium.lua)          |
| dgox15/oldworld.nvim                      | [GitHub](https://github.com/dgox16/oldworld.nvim)                      | [Config File](./.config/nvim/lua/plugins/colorschemes.lua)     |
| epwalsh/obsidian.nvim                     | [GitHub](https://github.com/epwalsh/obsidian.nvim)                     | [Config File](./.config/nvim/lua/plugins/obsidian.lua)         |
| folke/neodev.nvim                         | [GitHub](https://github.com/folke/neodev.nvim)                         | [Config File](./.config/nvim/lua/plugins/lsp.lua)              |
| folke/which-key.nvim                      | [GitHub](https://github.com/folke/which-key.nvim)                      | [Config File](./.config/nvim/lua/plugins/which-key.lua)        |
| hrsh7th/cmp-buffer                        | [GitHub](https://github.com/hrsh7th/cmp-buffer)                        | [Config File](./.config/nvim/lua/plugins/cmp.lua)              |
| hrsh7th/cmp-nvim-lsp                      | [GitHub](https://github.com/hrsh7th/cmp-nvim-lsp)                      | [Config File](./.config/nvim/lua/plugins/lsp.lua)              |
| hrsh7th/cmp-path                          | [GitHub](https://github.com/hrsh7th/cmp-path)                          | [Config File](./.config/nvim/lua/plugins/cmp.lua)              |
| hrsh7th/nvim-cmp                          | [GitHub](https://github.com/hrsh7th/nvim-cmp)                          | [Config File](./.config/nvim/lua/plugins/cmp.lua)              |
| j-hui/fidget.nvim                         | [GitHub](https://github.com/j-hui/fidget.nvim)                         | [Config File](./.config/nvim/lua/plugins/fidget.lua)           |
| kylechui/nvim-surround                    | [GitHub](https://github.com/kylechui/nvim-surround)                    | [Config File](./.config/nvim/lua/plugins/surround.lua)         |
| lewis6991/gitsigns.nvim                   | [GitHub](https://github.com/lewis6991/gitsigns.nvim)                   | [Config File](./.config/nvim/lua/plugins/git-signs.lua)        |
| L3MON4D3/LuaSnip                          | [GitHub](https://github.com/L3MON4D3/LuaSnip)                          | [Config File](./.config/nvim/lua/plugins/cmp.lua)              |
| lukas-reineke/indent-blankline.nvim       | [GitHub](https://github.com/lukas-reineke/indent-blankline.nvim)       | [Config File](./.config/nvim/lua/plugins/indent-blankline.lua) |
| MeanderingProgrammer/render-markdown.nvim | [GitHub](https://github.com/MeanderingProgrammer/render-markdown.nvim) | [Config File](./.config/nvim/lua/plugins/render-markdown.lua)  |
| mfussenegger/nvim-lint                    | [GitHub](https://github.com/mfussenegger/nvim-lint)                    | [Config File](./.config/nvim/lua/plugins/lint.lua)             |
| Mofiqul/vscode.nvim                       | [GitHub](https://github.com/Mofiqul/vscode.nvim)                       | [Config File](./.config/nvim/lua/plugins/colorschemes.lua)     |
| neovim/nvim-lspconfig                     | [GitHub](https://github.com/neovim/nvim-lspconfig)                     | [Config File](./.config/nvim/lua/plugins/lsp.lua)              |
| nvim-lua/plenary.nvim                     | [GitHub](https://github.com/nvim-lua/plenary.nvim)                     | [Config File](./.config/nvim/lua/plugins/telescope.lua)        |
| nvim-telescope/telescope-fzf-native.nvim  | [GitHub](https://github.com/nvim-telescope/telescope-fzf-native.nvim)  | [Config File](./.config/nvim/lua/plugins/telescope.lua)        |
| nvim-telescope/telescope.nvim             | [GitHub](https://github.com/nvim-telescope/telescope.nvim)             | [Config File](./.config/nvim/lua/plugins/telescope.lua)        |
| nvim-tree/nvim-web-devicons               | [GitHub](https://github.com/nvim-tree/nvim-web-devicons)               | [Config File](./.config/nvim/lua/plugins/telescope.lua)        |
| nvim-treesitter/nvim-treesitter           | [GitHub](https://github.com/nvim-treesitter/nvim-treesitter)           | [Config File](./.config/nvim/lua/plugins/treesitter.lua)       |
| onsails/lspkind.nvim                      | [GitHub](https://github.com/onsails/lspkind.nvim)                      | [Config File](./.config/nvim/lua/plugins/cmp.lua)              |
| rafamadriz/friendly-snippets              | [GitHub](https://github.com/rafamadriz/friendly-snippets)              | [Config File](./.config/nvim/lua/plugins/cmp.lua)              |
| saadparwaiz1/cmp_luasnip                  | [GitHub](https://github.com/saadparwaiz1/cmp_luasnip)                  | [Config File](./.config/nvim/lua/plugins/cmp.lua)              |
| saghen/blink.cmp                          | [GitHub](https://github.com/saghen/blink.cmp)                          | [Config File](./.config/nvim/lua/plugins/cmp.lua)              |
| stevearc/conform.nvim                     | [GitHub](https://github.com/stevearc/conform.nvim)                     | [Config File](./.config/nvim/lua/plugins/conform.lua)          |
| stevearc/oil.nvim                         | [GitHub](https://github.com/stevearc/oil.nvim)                         | [Config File](./.config/nvim/lua/plugins/oil.lua)              |
| tpope/vim-fugitive                        | [GitHub](https://github.com/tpope/vim-fugitive)                        | [Config File](./.config/nvim/lua/plugins/vim-fugitive.lua)     |
| WhoIsSethDaniel/mason-tool-installer.nvim | [GitHub](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) | [Config File](./.config/nvim/lua/plugins/mason.lua)            |
| williamboman/mason-lspconfig.nvim         | [GitHub](https://github.com/williamboman/mason-lspconfig.nvim)         | [Config File](./.config/nvim/lua/plugins/mason.lua)            |
| williamboman/mason.nvim                   | [GitHub](https://github.com/williamboman/mason.nvim)                   | [Config File](./.config/nvim/lua/plugins/mason.lua)            |
| windwp/nvim-autopairs                     | [GitHub](https://github.com/windwp/nvim-autopairs)                     | [Config File](./.config/nvim/lua/plugins/autopairs.lua)        |
| windwp/nvim-ts-autotag                    | [GitHub](https://github.com/windwp/nvim-ts-autotag)                    | [Config File](./.config/nvim/lua/plugins/ts-autotag.lua)       |
