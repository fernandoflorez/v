" we are millenials
set nocompatible

let g:v_path = escape(fnamemodify(resolve(expand("<sfile>:p")), ":h"), ' ')

" auto-install vim-plug
if empty(glob(g:v_path . '/core/autoload/plug.vim'))
  exe 'r !curl -sfLo ' . g:v_path . '/core/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | q
endif
exe 'source ' . g:v_path . '/core/autoload/plug.vim'

" plugins
call plug#begin(g:v_path . '/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'vim-syntastic/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'blueyed/vim-python-pep8-indent'
Plug 'honza/vim-snippets'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'dracula/vim'
Plug 'elzr/vim-json'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'psf/black', {'branch': 'stable'}
call plug#end()

if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

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
set scrolloff=4
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

" if has('statusline')
    " always display statusline
    " set laststatus=2

    " customize
    " set statusline=%f
    " set statusline+=%=
    " set statusline+=\ %#warningmsg#
    " if isdirectory(g:plugs.syntastic.dir)
    "     set statusline+=%{SyntasticStatuslineFlag()}
    " endif
    " set statusline+=%*\ [%P]
" endif

" Set default snipmate version to 1
let g:snipMate = { 'snippet_version' : 1 }

if isdirectory(g:plugs.nerdtree.dir)
    nnoremap <leader>n :NERDTreeToggle<CR>
endif
nnoremap <leader><space> :nohlsearch<CR>
" avoid unindenting from smartindent
inoremap # X#

if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif
