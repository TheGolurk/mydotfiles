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
Plugin 'sheerun/vim-polyglot'

call vundle#end()            " required
filetype plugin indent on    " required

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wadackel/vim-dogrun'
Plug 'ayu-theme/ayu-vim'

call plug#end()

"Personal Config
syntax on
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
set nohlsearch

" Eneable Gruvbox and set colorscheme
"autocmd vimenter * colorscheme gruvbox
"set background=dark
"set background=light
"let g:gruvbox_contrast_dark = 'hard'
"let g:gruvbox_contrast_light = 'hard'

"set t_Co=256   " This is may or may not needed.

"set background=light
"colorscheme PaperColor
set termguicolors
"let ayucolor="light"
let ayucolor="mirage"
"let ayucolor="dark"
colorscheme ayu"

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

set mouse=a

"  COC-SNIPPETS
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'