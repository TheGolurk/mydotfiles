set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'fatih/vim-go'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'enricobacis/vim-airline-clock'
Plugin 'zxqfl/tabnine-vim'

call vundle#end()            " required
filetype plugin indent on    " required

Personal Config
set number
set linebreak
set textwidth=100
set showmatch
set visualbell
set hlsearch
set smartcase
set ignorecase
set incsearch
set autoindent
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4 tabstop=4
set ruler
set undolevels=1000
set backspace=indent,eol,start
set noswapfile
set undodir=~/.vim/undodir
set undofile
set smartcase
set nu

" Eneable Gruvbox and set colorscheme
autocmd vimenter * colorscheme gruvbox
set background=dark
"set background=light
let g:gruvbox_contrast_dark = 'hard'
"let g:gruvbox_contrast_light = 'hard'

" Smart tab line from vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Switch easy for tabs
nmap <Space>- <Plug>AirlineSelectPrevTab
nmap <Space>+ <Plug>AirlineSelectNextTab

" Clock
let g:airline#extensions#clock#format = '%b %d %X'
let g:airline#extensions#clock#updatetime = 1000

" Vim Airline theme
let g:airline_theme='simple'

" YCM
nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gr :YcmCompleter GoToReferences<CR>
