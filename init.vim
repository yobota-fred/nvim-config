
" PLUGINS
call plug#begin()
Plug 'junegunn/vim-github-dashboard'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-heroku'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-markdown'
Plug 'airblade/vim-gitgutter'
Plug 'skywind3000/asyncrun.vim'
Plug 'w0rp/ale'
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'davidhalter/jedi-vim'
call plug#end()
" BASICS
" set nocompatible
filetype on
set history=10000
let mapleader = "\<Space>"
set hidden

" UI
" middle-click mouse paste
set mouse=v
set termguicolors
" relative line numbers, but absolute current line
set number relativenumber
" keep the linting gutter open
let g:ale_sign_column_always = 1
" show file in terminal title
set title


" HIGHLIGHTING
set hlsearch
" Show matching brackets
set showmatch
set cursorline
let g:markdown_fenced_languages = ['html', 'js=javascript', 'json=javascript', 'python', 'sql', 'bash=sh', 'sh']

" INDENTATION
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" SEARCH
" case-sensitive only if has uppercase
set ignorecase smartcase
set incsearch
let g:fzf_tags_command = 'mktags'
let g:fzf_layout = { 'window': '-tabnew' }
" Unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>
nnoremap <leader>f :GFiles<CR>
nnoremap <leader>t :GFiles<CR>'tests/ \| 'spec/ \| 'unit/ 
" Find usages of word under cursor
nnoremap <leader>u :Ag <C-R><C-W><CR>
nnoremap <leader>g :Tag <CR>

" VIMRC
" Source the vimrc after saving it
if has('autocmd')
    augroup reload_vimrc " {
        autocmd!
        autocmd bufwritepost init.vim source $MYVIMRC
    augroup END "}
endif
" open vimrc in a new tab
nnoremap <leader>v :tabedit $MYVIMRC<CR>

" COMMANDS
" ensure dir exists for current buffer
cnoremap mmm !mkdir -p <c-r>=expand("%:h")<cr>/
" open files as expected (including URLs)
let g:netrw_browsex_viewer = 'xdg-open'

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

" VCS / GIT
nnoremap <leader>b :Gblame<CR>
nnoremap <leader>m :Gmove 
nnoremap <leader>d :Gvdiff<CR>

colorscheme molokai
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1

