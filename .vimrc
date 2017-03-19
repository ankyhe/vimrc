"==================================================
" Title      VIM configuration file
" Author     AnkyHe, ankyhe@gmail.com
" Date       2010/05/19 2.0
" Date       2017/03/18 3.0
" Location   Beijing, China
" Version    3.0
"            This configure file will used in all 
"            platforms, including Win32, Linux and
"            Mac
"**************************************************

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/desertEx'
Plugin 'vim-scripts/mru.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'majutsushi/tagbar.git'
Plugin 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

call vundle#end()          
filetype plugin indent on

" Globl setting
set tabstop=2
set shiftwidth=2
set autowriteall
set incsearch
set nowrap
set browsedir=current
set backup
set backupext=.bak
set backupdir=$HOME/.vimbackupdir 
set dir=$HOME/.vimswapdir 
if v:version >= 703 
	set undodir=$HOME/.vimundodir
endif
set sessionoptions+=unix,slash
set splitbelow
set background=dark
set ruler
set backspace=indent,eol,start
set history=100
set showcmd
set hlsearch
set virtualedit=all
set noignorecase
set whichwrap=b,s,h,l,<,>,[,]
set number
set numberwidth=1
set listchars=tab:>-,trail:-
set iskeyword+=-
set diffopt+=vertical
set tabpagemax=20
set foldmethod=manual
set vb t_vb=
syntax on
colo desertEx
source $VIMRUNTIME/ftplugin/man.vim

" go to last cursor
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif

" cd to dir of current file
if has("autocmd")
  autocmd BufEnter * :lcd %:p:h
endif 

" toolbar etc
if has('gui_running')
	set guioptions -=T
	set guioptions -=m
	if has('win32')
		set guifont=DejaVu_Sans_Mono:h11:cANSI
	endif
	if has('mac')
		set guifont=Monaco:h14
	endif
endif

if has('mac')
	set term=xterm-256color
elseif has('unix')
	set term=xterm-256color
endif


" Common key mapping
map <C-m> :%s/\r//g<CR><Esc>
map <S-RIGHT> zL
map <S-LEFT> zH
map <UP> gk
map <Down> gj
map <M-c> "+y
map <M-x> "+d
map <M-v> "+p

"ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.a,*.o,*.class,*.pyc

"tagbar
let g:tagbar_left = 1
nmap <F8> :TagbarToggle<CR>

"YCM
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Python setting
au BufNewFile,BufRead *.py setl tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix encoding=utf-8

" Go
let g:go_fmt_command = "goimports"

" Remove spaces
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.go,*.java,*.rb,*.js match BadWhitespace /\s\+$/

