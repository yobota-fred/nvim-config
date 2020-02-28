
" " PLUGINS
call plug#begin()
Plug 'junegunn/vim-github-dashboard'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'skywind3000/asyncrun.vim'
Plug 'w0rp/ale'
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'davidhalter/jedi-vim'
Plug 'mattn/emmet-vim'
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'lifepillar/pgsql.vim'
Plug 'SirVer/UltiSnips'
Plug 'nvie/vim-flake8'
call plug#end()

" BASICS
" set nocompatible
filetype on
set history=10000
let mapleader = "\<Space>"
set hidden
set encoding=utf-8
set noswapfile

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

" LANGUAGE SPECIFIC
" default
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set fileformat=unix

let g:ale_fix_on_save = 1
let g:ale_fixers = {
\ 'javascript': ['prettier'],
\ 'python': ['autopep8', 'remove_trailing_lines', 'isort', 'black'],
\ 'scss': ['prettier', 'trim_whitespace', 'remove_trailing_lines']
\}
let g:ale_echo_msg_format = '%linter% says %code: %%s'
let g:ale_linters = {
\ 'javascript': ['eslint', 'fecs', 'flow', 'flow-language-server', 'jscs', 'jshint', 'standard', 'xo']
\}

" misc
nnoremap <leader>e :e .env<CR>

" python
autocmd FileType python set
    \ tabstop=4
    \ shiftwidth=4
    \ softtabstop=4
    \ textwidth=119
    \ expandtab
    \ autoindent
    \ fileformat=unix

" JS
autocmd FileType javascript set
    \ tabstop=2
    \ shiftwidth=2
    \ softtabstop=2
    \ expandtab
    \ fileformat=unix
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

" SQL/postgresql
let g:sql_type_default = 'pgsql'

" SEARCH
" case-sensitive only if has uppercase
set ignorecase smartcase
set incsearch
let g:fzf_tags_command = 'mktags'
" let g:fzf_layout = { 'window': '-tabnew' }
" Unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>
nnoremap <leader>f :GFiles<CR>
nnoremap <leader>t :GFiles<CR>'tests/ \| 'spec/ \| 'unit/ \| 'spec.js 
" Find usages of word under cursor
nnoremap <leader>u :Ag <C-R><C-W><CR>
nnoremap <leader>/ :Tag <CR>
nnoremap <leader>b :Buffers<CR>

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
nnoremap <leader>m :!mkdir -p <c-r>=expand("%:h")<cr>/<CR>
nnoremap <leader>x :!chmod +x %<CR>
nnoremap <leader>w :!xdg-open %<CR>
" open files as expected (including URLs)
let g:netrw_browsex_viewer = 'xdg-open'

com! FormatJSON %!python -m json.tool
nnoremap =j :FormatJSON<CR>

" neovim-specific
" let g:python3_host_prog='/home/fred/.virtualenvs/globals/bin/python'

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
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gw :Gbrowse<CR>
nnoremap <leader>gm :Gmove 
nnoremap <leader>gd :Gvdiff<CR>

colorscheme molokai
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1

