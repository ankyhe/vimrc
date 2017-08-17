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
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'vim-scripts/desertEx'
Plugin 'vim-scripts/mayansmoke'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ankyhe/lilydjwg_green'
Plugin 'vim-scripts/oceanlight'
Plugin 'jnurmine/Zenburn'
Plugin 'vim-scripts/mru.vim'
Plugin 'vim-scripts/Mark--Karkat'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
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
set background=light
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
set t_Co=256
syntax on
colo lilydjwg_green
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

" Common key mapping
map <C-m> :%s/\r//g<CR><Esc>
map <S-RIGHT> zL
map <S-LEFT> zH
map <UP> gk
map <Down> gj
map <M-c> "+y
map <M-x> "+d
map <M-v> "+p

"air-line
set laststatus=2
set cmdheight=1
let g:airline_theme="luna" 
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#enabled=0
let g:airline#extensions#tabline#buffer_nr_show=0

"buffergator
let g:buffergator_viewport_split_policy="n"

"ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.a,*.o,*.class,*.pyc

"tagbar
let g:tagbar_left = 1
nmap <F8> :TagbarToggle<CR>

"autopairs
let g:AutoPairsFlyMode=1

"YCM
"set completeopt=longest,menu
let g:ycm_global_ycm_extra_conf='~/vimrc/.ycm_extra_conf.py'
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_key_invoke_completion = '<M-Space>'
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Python setting
au BufNewFile,BufRead *.py setl tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix encoding=utf-8

" Go
let g:go_fmt_command = "goimports"
