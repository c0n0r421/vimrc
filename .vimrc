" ───── Plugin Manager ─────
" Install vim-plug first: https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" File explorer
Plug 'preservim/nerdtree'

" Status line
Plug 'vim-airline/vim-airline'

" Fuzzy finder
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
set number            " Show line numbers
set relativenumber    " Relative line numbers
set tabstop=4         " Tabs = 4 spaces (Python default)
set shiftwidth=4
set expandtab         " Convert tabs to spaces
set smartindent       " Auto-indent new lines
set cursorline        " Highlight current line
set ignorecase        " Case-insensitive search
set smartcase         " ...unless uppercase letters are used
set hlsearch          " Highlight search results
set incsearch         " Incremental search
set clipboard=unnamedplus " Use system clipboard
set background=dark
colorscheme gruvbox

" ───── Python Specific ─────
let g:ale_linters = {'python': ['flake8', 'mypy', 'pylint']}
let g:ale_fixers = {'python': ['black', 'isort']}
let g:ale_fix_on_save = 1

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
