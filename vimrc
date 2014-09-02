set nocompatible
filetype off

set rtp+=/usr/local/go/misc/vim
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'altercation/vim-colors-solarized'
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-fugitive'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'YankRing.vim'
Bundle 'git://git.wincent.com/command-t.git'

let g:CommandTMatchWindowAtTop = 1
let g:EasyMotion_leader_key = ';'
let g:Powerline_symbols = 'fancy'
let g:yankring_history_file = '.yankring_history'

" Color
colorscheme solarized

" Indentation
filetype plugin indent on
au BufNewFile,BufReadPost *.go,*.rb,*.erb,*.css,*.scss,*.html,*.js setl shiftwidth=2 expandtab

" Mappings
let mapleader = ","
nmap <Leader>b :FufBuffer<CR>
nmap <Leader>d :FufDir<CR>
nmap <Leader>f :FufFile<CR>
nmap <Leader>F :FufCoverageFile<CR>
nmap <Leader>k :bd<CR>
nmap <Leader>K :bd!<CR>
nmap <Leader>n :enew<CR>
nmap <Leader>q :q<CR>
nmap <Leader>Q :q!<CR>
nmap <Leader>t :CommandT<CR>
nmap <Leader>w :w<CR>
nmap <Leader>ev :e $MYVIMRC<CR>
nmap <Leader>sv :so $MYVIMRC<CR>
nmap <Leader>/ :nohlsearch<CR>
imap jk <Esc>

" Settings
set background=dark
set cursorline
set guifont=Monaco:h14
set guioptions-=T
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=extends:>,precedes:<,tab:>-,trail:~
set nobackup
set noswapfile
set nowrap
set number
set smartcase
set wildignore+=bin/**
set wildignore+=vendor/**

fun! <SID>StripTrailingWhitespace()
  let l = line(".")
  let c = col(".")
  let _s = @/
  %s/\s\+$//e
  let @/ = _s
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespace()
