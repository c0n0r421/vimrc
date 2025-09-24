" ───── Plugin Manager ─────
" Install vim-plug first: https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" File explorer
Plug 'preservim/nerdtree'

" Status line
Plug 'vim-airline/vim-airline'

" Fuzzy finder core and wrapper
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Commenting
Plug 'tpope/vim-commentary'

" Surroundings (quotes, brackets, etc.)
Plug 'tpope/vim-surround'

" Git integration
Plug 'tpope/vim-fugitive'

" Language packs (syntax highlighting)
Plug 'sheerun/vim-polyglot'

" Asynchronous linting (Python lint/format support)
Plug 'dense-analysis/ale'

" Theme
Plug 'morhetz/gruvbox'

call plug#end()

" ───── General Settings ─────
syntax on
filetype plugin indent on

set number            " Show line numbers
set relativenumber    " Relative line numbers
set hidden            " Allow background buffers
set tabstop=4         " Tabs = 4 spaces (Python default)
set shiftwidth=4
set expandtab         " Convert tabs to spaces
set smartindent       " Auto-indent new lines
set cursorline        " Highlight current line
set signcolumn=yes    " Keep sign column visible for ALE
set scrolloff=3       " Keep context above/below cursor
set splitright        " Vertical splits open to the right
set splitbelow        " Horizontal splits open below
set ignorecase        " Case-insensitive search
set smartcase         " ...unless uppercase letters are used
set hlsearch          " Highlight search results
set incsearch         " Incremental search
set updatetime=300    " Quicker updates for ALE and CursorHold
if has('clipboard')
  set clipboard=unnamedplus " Use system clipboard when available
endif
set background=dark
if has('termguicolors')
  set termguicolors
endif
colorscheme gruvbox

" ───── Python Specific ─────
let g:ale_linters = {'python': ['flake8', 'mypy', 'pylint']}
let g:ale_linters_explicit = 1
let g:ale_fixers = {'python': ['black', 'isort']}
let g:ale_fix_on_save = 1
let g:ale_python_isort_options = '--profile black'
let g:ale_python_flake8_options = '--max-line-length=88'
let g:airline#extensions#ale#enabled = 1

augroup python_settings
  autocmd!
  autocmd FileType python setlocal colorcolumn=88
augroup END

" ───── Keymaps ─────
" Space as <Leader>
let mapleader=" "

" NERDTree toggle
nnoremap <leader>e :NERDTreeToggle<CR>

" FZF file search
nnoremap <leader>f :Files<CR>

" Comment/uncomment with leader + /
nnoremap <leader>/ :Commentary<CR>

" Git blame (fugitive)
nnoremap <leader>gb :Git blame<CR>

" ALE linting navigation
nnoremap <leader>n :ALENext<CR>
nnoremap <leader>p :ALEPrevious<CR>

" Manual linting/formatting shortcut
nnoremap <leader>af :ALEFix<CR>

