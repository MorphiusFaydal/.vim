# My .vim Files

Contains my vimrc and plugins

Uses native vim packages for plugin management.

## Installation
Clone into home directory (~ on Linux, C:\User\<username>\ on Windows)

On Windows, you must also run `mklink /d vimfiles .vim` from your home
directory.

On a clean installation, submodules will need to be initialized:
1. `git submodule init`
2. `git submodule update`

## Updating
1. Update base vim files with `git pull`
2. Update submodules with `git submodule update --remote --recursive`

## Plugins
- Utility Plugins
    - [coc.nvim](https://github.com/neoclide/coc.nvim)
    - [vim-airline](https://github.com/vim-airline/vim-airline)
    - [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
    - [NERD Commenter](https://github.com/preservim/nerdcommenter/)
- Syntax
    - [vim-ps1](https://github.com/PProvost/vim-ps1/)
    - [vim-markdown](https://github.com/preservim/vim-markdown)
- Colorschemes
    - [Solarized](https://github.com/altercation/vim-colors-solarized)
    - [Jellybeans](https://github.com/nanotech/jellybeans.vim)
    - [Molokai](https://github.com/tomasr/molokai)
    - [Monokai](https://github.com/sickill/vim-monokai)
    - [Nord](https://github.com/arcticicestudio/nord-vim)

