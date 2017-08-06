" PLUGINS
call plug#begin()
Plug 'junegunn/vim-github-dashboard'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
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
let g:fzf_tags_command = 'ag -l | ctags --links=no -L-'
let g:fzf_layout = { 'window': '-tabnew' }
" Unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>
nnoremap <leader>f :GFiles<CR>
nnoremap <leader>t :GFiles<CR>'tests/ \| 'spec/ \| 'unit/ 
" Find usages of word under cursor
nnoremap <leader>u :Ag <C-R><C-W><CR>

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

" VCS
nnoremap <leader>b :Gblame<CR>
nnoremap <leader>m :Gmove 

colorscheme molokai
