set nocompatible              " be improved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'enricobacis/vim-airline-clock'
Plugin 'sheerun/vim-polyglot' 

call vundle#end()            " required
filetype plugin indent on    " required

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wadackel/vim-dogrun'
Plug 'ayu-theme/ayu-vim'
Plug 'Yggdroot/indentLine'
Plug 'dense-analysis/ale'
Plug 'pineapplegiant/spaceduck'
Plug 'arcticicestudio/nord-vim'

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
set nocursorline
set lazyredraw
set synmaxcol
set shortmess=at

" Eneable Gruvbox and set colorscheme
" autocmd vimenter * colorscheme gruvbox
" set background=dark
"set background=light
" let g:gruvbox_contrast_dark = 'hard'
"let g:gruvbox_contrast_light = 'hard'

if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" colorscheme spaceduck

set t_Co=256

colorscheme nord

"set background=light

" Smart tab line from vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Switch easy for tabs
nmap <Space>- <Plug>AirlineSelectPrevTab
nmap <Space>+ <Plug>AirlineSelectNextTab

" Switch buffers
nmap bn :bnext <CR>
nmap bp :bprevious <CR>

" New tab
nmap tn :tabnew <CR>
" Open Terminal
nmap tr :terminal <CR>
" Split Vertically
nnoremap <C-V> :vsplit .<CR>
" Split
nnoremap <C-H> :split .<CR>

" Open Netrw (vscode style)
nnoremap <C-B> :Vexplore .<CR>

" Exit
nnoremap <C-D> :q<CR>
" Exit and save
nnoremap <C-X> :x<CR>
" Save
nnoremap <C-s> :w<CR>

" Only window
nmap on :only <CR>

" Pro Look netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_browse_split = 4

" Identline
set conceallevel=1
let g:indentLine_conceallevel=1
let g:indentLine_setColors = 0
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_faster = 1

" Clock
let g:airline#extensions#clock#format = '%b %d %X'
let g:airline#extensions#clock#updatetime = 1000

" Vim Airline theme
let g:airline_theme='fruit_punch'
" let g:airline_theme='minimalist'
" let g:airline_theme='violet'

let g:airline_powerline_fonts = 1

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = '||'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''

" Ale
let b:ale_linter_aliases = ['javascript', 'vue']
let b:ale_linters = ['eslint', 'vls']
let g:ale_fix_on_save = 1
