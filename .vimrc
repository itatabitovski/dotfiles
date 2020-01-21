set termguicolors
set nocompatible


if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()


colorscheme dracula

syntax on

set encoding=utf-8
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set autoindent smartindent
set number showcmd cursorline colorcolumn=79
set showmatch lazyredraw wildmenu
set incsearch hlsearch
set foldenable
set laststatus=2

filetype plugin indent on

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" reload .vimrc on save
autocmd! BufWritePost $MYVIMRC source $MYVIMRC
" remove trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e
