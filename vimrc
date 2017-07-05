" stop vi compatibility
set nocompatible

" Install Pathogen
execute pathogen#infect()
execute pathogen#helptags()

" GUI settings
if has("gui_running")
	" set default window size
	set lines=28 columns=85

	" GUI hide stuff
	set guioptions-=T " Hide GUI toolbar
	set guioptions-=M " Hide GUI menu

	" OS specfic GUI
	if has("gui_win32")
		source $VIMRUNTIME/mswin.vim
		set guifont=Consolas:h10
	elseif has("mac")
		set guifont=Inconsolata:h14
	else
		set guitfont Inconsolata\ Medium\ 12
	endif
endif


" default working directory to home on windows, not system32
if has("win32")
	cd $USERPROFILE
endif

" theming
colorscheme monokai
set background=dark

" default encoding
set encoding=utf-8

" sane backspace behavior
set backspace=indent,eol,start

" syntax highlighting and autoindentation
syntax on
filetype plugin indent on
set autoindent

" show matching [{()}]
set showmatch

" tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4

" show line numbers, ruler and line widths
set number
set ruler
set colorcolumn=80

" search options
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

" new escape sequence
inoremap jk <ESC>

" disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" make vim-airline show
set laststatus=2

" disable automatic folding in vim-markdown
let g:vim_markdown_folding_disabled=1
