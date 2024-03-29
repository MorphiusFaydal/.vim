" stop vi compatibility
set nocompatible

" default working directory to home on windows, not system32
" also sets to use '.vim' instead of 'vimfiles'
if has("win32") || has("win64")
	cd $USERPROFILE
	set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

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
		set guifont=Cascadia_Code:h10
	elseif has("mac")
		set guifont=Inconsolata:h12
	else
		set guifont=Inconsolata\ 11
	endif
endif

" theming
colorscheme monokai
set background=dark
"set termguicolors

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

" show line numbers and relative numbers, ruler and line widths
set number
set ruler
set colorcolumn=80

" search options
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

" good menu for buffers
set wildchar=<Tab> wildmenu wildmode=full

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

" move viminfo file. include neovim stuff, in case it's used...
if has('shada')
	set shada+=n~/.nvim/shada
else
	set viminfo+=n~/.vim/viminfo
endif

" Backup/temp/undo directories and files
" Ensure directories exist
if !isdirectory($HOME.'/.vim/backup')
	silent call mkdir($HOME.'/.vim/backup', 'p')
endif
if !isdirectory($HOME.'/.vim/temp')
	silent call mkdir($HOME.'/.vim/temp', 'p')
endif
if !isdirectory($HOME.'/.vim/undo')
	silent call mkdir($HOME.'/.vim/undo', 'p')
endif

" set options
set backup
set undofile

" set directories
set backupdir=$HOME/.vim/backup//
set directory=$HOME/.vim/temp//
set undodir=$HOME/.vim/undo//

" make vim-airline show
set laststatus=2

" disable automatic folding in vim-markdown
let g:vim_markdown_folding_disabled=1


""" coc.nvim configuration

" TextEdit might fail if hidden is not set
set hidden

" Give more space for displaying messages
set cmdheight=2

" Shorten update time. Default is is 4000 (4 sec).
" This gives better user experience
set updatetime=300

" Don't pass messages to |ins-completion-menu|
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
	" recent vim can merge signcolumn and number column into one
	set signcolumn=number
else
	set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate
" Use command ':verbose imap <tab> to make sure tab is not used by other
" plugins
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notifiy coc.nvim to
" format on enter, <cr> could also be remapped by other vim plusins
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
		\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
