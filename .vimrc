" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
"
" Misc settings
syntax on
filetype plugin indent on
set history=666
set undolevels=666
set wildmode=longest,list,full
set wildmenu
set wildignore=*.swp,*.bak,*~,*.pyc
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set nobackup		" do not keep a backup file, use versions instead
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set mouse=a
set ff=unix

" Indent settings
set tabstop=4
set ts=4
set shiftwidth=4
set expandtab
set smarttab
set smartindent
set autoindent
set copyindent

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase 

" Keyboard mappings 
inoremap jj <Esc>
nnoremap ; :
nnoremap j gj
nnoremap k gk
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Tab navigation
nnoremap <C-S-Tab> :tabprevious<CR>
nnoremap <C-Tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
nnoremap <C-q>     :tabclose<CR>
inoremap <C-S-Tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>
inoremap <C-t>     <Esc>:tabclose<CR>
" Allow to save as root
cmap w!! w !sudo tee % >/dev/null
" Buftabs bindings
noremap <f1> :bprev<CR> 
noremap <f2> :bnext<CR>
noremap <f3> :bdelete<CR>

" Display settings
set t_Co=256
colorscheme donbass
set number

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" CtrlP settings
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" Powerline settings
set laststatus=2

" Remove trailing whitespaces
if has("autocmd")
    autocmd BufWritePre *.py :%s/\s\+$//e
endif

" Vundle
filetype off
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()
source ~/.vim/bundles.vim
filetype plugin indent on

filetype on
