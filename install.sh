#! /bin/bash

if [ ! -d "$HOME/.vimswapdir" ]; then
  mkdir $HOME/.vimswapdir
fi

if [ ! -d "$HOME/.vimbackupdir" ]; then
  mkdir $HOME/.vimbackupdir
fi

if [ ! -d "$HOME/.vimundodir" ]; then
  mkdir $HOME/.vimundodir
fi

if [ ! -d "$HOME/.vim/bundle" ]; then
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
