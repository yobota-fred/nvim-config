" PLUGINS
call plug#begin()
Plug 'junegunn/vim-github-dashboard'
Plug 'wincent/command-t', {
    \ 'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
    \ }
Plug 'skywind3000/asyncrun.vim'
Plug 'w0rp/ale'
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
call plug#end()
" BASICS
" set nocompatible
filetype on
set history=10000

" UI
" middle-click mouse paste
set mouse=v
set termguicolors
" relative line numbers, but absolute current line
set number relativenumber
" keep the linting gutter open
let g:ale_sign_column_always = 1


" HIGHLIGHTING
set hlsearch
" Show matching brackets
set showmatch
set cursorline

" INDENTATION
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" SEARCH
" case-sensitive only if has uppercase
set ignorecase smartcase
set incsearch

" VIMRC
" Source the vimrc after saving it
if has('autocmd')
	autocmd bufwritepost init.vim source $MYVIMRC
endif
" open vimrc in a new tab
nnoremap <leader>v :tabedit $MYVIMRC<CR>

" COMMANDS
" ensure dir exists for current buffer
cnoremap mmm !mkdir -p <c-r>=expand("%:h")<cr>/

" neovim-specific
let g:python3_host_prog='/home/fred/.virtualenvs/globals/bin/python'

" SYSTEM INTERACTION
" copy/paste to/from system clipboard
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

colorscheme molokai
