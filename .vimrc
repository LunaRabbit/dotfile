call plug#begin('~/.vim/plugged')
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'https://github.com/guns/vim-clojure-static.git'
Plug 'https://github.com/guns/vim-clojure-highlight.git'
Plug 'https://github.com/scrooloose/syntastic.git'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/rking/ag.vim.git'
Plug 'https://github.com/tpope/vim-surround.git'
call plug#end()

syntax enable
set number
set ruler
set incsearch
set hlsearch
set expandtab
set autoindent
set tabstop=2
set splitbelow
set splitright
set ignorecase
set smartcase

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

autocmd FileType python set tabstop=4
autocmd bufwritepost .vimrc source $MYVIMRC

fun! <SID>StripTrailingWhitespace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespace()
autocmd FileType * RainbowParentheses

let g:ag_working_path_mode="r"
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
let g:ctrlp_match_window = 'results:100'
