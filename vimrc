" we are millenials
set nocompatible

" auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  exe 'r !curl -sfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | q
endif
exe 'source ~/.vim/autoload/plug.vim'

" plugins
call plug#begin()
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'blueyed/vim-python-pep8-indent'
Plug 'honza/vim-snippets'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'elzr/vim-json'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'psf/black', {'branch': 'stable'}
Plug 'Donaldttt/fuzzyy'
call plug#end()

set nomodeline

" please no
set belloff=all

set nowrap
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set shiftwidth=4
set number
set scrolloff=8
set backspace=indent,eol,start

" lots of undos
set history=100
set undolevels=100

set nobackup
set noswapfile

" search
set incsearch
set ignorecase
set smartcase
set hlsearch

" filename auto-complete
set wildmode=list:longest

if exists('+colorcolumn')
    set colorcolumn=80
endif

" coc autocomplete
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" highlight cursor line
set cursorline

" split vertical windows below
set splitbelow

" visual select after tab/untab
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

filetype indent plugin on
syntax enable

if has('gui_running')
    set guioptions-=T
endif

" Set default snipmate version to 1
let g:snipMate = { 'snippet_version' : 1 }

nnoremap <leader><space> :nohlsearch<CR>

" avoid unindenting from smartindent
inoremap # X#

" customization for v:
" https://github.com/fernandoflorez/v/

" change map leader
let mapleader = ","
let g:mapleader = ","

" nerdcommenter customization
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDToggleCheckAllLines = 1

" display json quotes
let g:vim_json_syntax_conceal = 0

" python's black customization
let g:black_linelength = 79
let g:black_preview = 1

set relativenumber

if has('gui_running')
    " set font and font size
    set guifont=Hack:h12
" else
endif

silent! colorscheme onehalfdark
let g:airline_theme='onehalfdark'

" force to learn
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
