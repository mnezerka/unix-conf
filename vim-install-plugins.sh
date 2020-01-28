#!/usr/bin/env bash

# create bundle dir if it doesn't exist
mkdir -p vim/.vim/bundle

cd vim/.vim/bundle

git clone https://github.com/tpope/vim-pathogen.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/bling/vim-airline.git
git clone https://github.com/scrooloose/syntastic.git
git clone https://github.com/majutsushi/tagbar.git
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/altercation/vim-colors-solarized.git

