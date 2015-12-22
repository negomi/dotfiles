" Use Vim settings, rather than Vi settings (must be first uncommented line)
set nocompatible


""" Vundle config & plugins

filetype off
" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
" UI
Plugin 'chriskempson/base16-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
" Search
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
" Editing
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/nerdcommenter'
" Syntax
Plugin 'scrooloose/syntastic'
Plugin 'elzr/vim-json'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'jelera/vim-javascript-syntax'

call vundle#end()
filetype plugin indent on


""" Leader

let mapleader=" "


""" Color scheme

syntax on
set background=dark
colorscheme base16-default


""" Status line

" Always show status line
set laststatus=2
" Show symbols in status line
let g:airline_powerline_fonts = 1
" Show Git branch in status line
set statusline+=%{fugitive#statusline()}


""" Buffers

" Enable list of buffers
let g:airline#extensions#tabline#enabled = 1
" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'
" Allow buffers to be hidden if you've modified a buffer
set hidden
" Open a new empty buffer
nmap <leader>T :enew<CR>
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer
nmap <leader>bq :bdelete<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>


""" CtrlP

" Default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules|bower_components|target|tmp)|(\.(swp|ico|git))$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}
" Use the nearest .git directory as the cwd
let g:ctrlp_working_path_mode = 'r'
" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<CR>
nmap <leader>bm :CtrlPMixed<CR>
nmap <leader>bs :CtrlPMRU<CR>


noremap <Right> <NOP>

""" NERDTree

" Use a leader instead of the actual named binding
nmap <leader>n :NERDTreeToggle<CR>


""" NERDCommenter

" Add space when commenting
let NERDSpaceDelims=1


""" Syntastic
let g:syntastic_jshint_exec=''
let g:syntastic_javascript_checkers = ['eslint']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


""" General tweaks

" Show relative line numbers
set relativenumber
" Highlight current line
set cursorline
" Don't wrap lines
set nowrap
" Show whitespace
set list listchars=tab:»·,trail:·,nbsp:·
" Use better Vim command autocompletion
set wildmenu wildmode=full
" Use spaces, soft tabs, 2 chars
set softtabstop=2 shiftwidth=2 expandtab
" Searches are case insensitive unless they contain at least one capital letter
set ignorecase smartcase
" Jump to position during search
set incsearch
" Shorten mode switch delays
set timeoutlen=200 ttimeoutlen=0
" Show 80 char limit point
set textwidth=80
set colorcolumn=+1
" Bind paste from clipboard
nmap <leader>p :r !pbpaste<CR>
" Disable autocommenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Autotrim trailing whitespace
autocmd FocusLost,BufLeave,WinLeave * :silent! :%s/\s\+$//e
" Autosave
autocmd FocusLost,BufLeave,WinLeave * :silent! wa
" Better full project search (:Se SearchItem scss)
command -nargs=+ Se execute 'vimgrep /' . [<f-args>][0] . '/ **/*.' . [<f-args>][1]
" Autoupdate when files are changed externally
set autoread


" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
