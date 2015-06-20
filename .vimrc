execute pathogen#infect()

set nocompatible
set encoding=utf-8
set confirm
set showcmd
set showmode
set virtualedit=block
set relativenumber
set number
set undofile
set modeline
set modelines=5
set scrolloff=6
set wildmenu
set wildmode=list:longest
set cursorline

" indent
set autoindent
set smartindent

" whitespace
set nowrap                      " don't wrap lines
set expandtab                   " use spaces, not tabs (optional)
set tabstop=2                   " a tab is two spaces
set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start  " backspace through everything in insert mode

" filetypes
filetype on
filetype plugin on
filetype indent on

" leader key
let mapleader=" "

" search
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap / /\v
vnoremap / /\v
nnoremap <leader><space> :noh<cr>

" folding
let ruby_fold = 1
set foldlevelstart=2

" completion
set completeopt=menu,longest,preview

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme = 'zenburn_gf'

" syntax highlighting
syntax on
let ruby_operators = 1
"set t_Co=256
let g:zenburn_high_Contrast = 1
let g:zenburn_old_Visual = 1
colors zenburn
hi MatchParen ctermfg=Magenta ctermbg=234
"hi search ctermbg=223 ctermfg=238
"hi incsearch ctermbg=216 ctermfg=242 

" file browser (and tab/buffer integration)
" let g:netrw_browse_split = 3
" TODO: keep tree open when opening first file
let NERDTreeQuitOnOpen = 0
nnoremap <Leader>d :NERDTreeToggle<CR>

" tags
nnoremap <Leader>t :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1
"highlight TagbarHighLight ctermfg=black ctermbg=darkyellow

" slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": ":2"}

" buffers as tabs
set hidden
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
function LeaveNERDTreeBuffer()
  if @% =~ '^NERD_tree'
    return "\<C-w>l" 
  endif
endfunction
nnoremap <expr> <Leader>- LeaveNERDTreeBuffer()." :bprevious\<CR>"
nnoremap <expr> <Leader>= LeaveNERDTreeBuffer()." :bnext\<CR>"
nnoremap <expr> <Leader>n LeaveNERDTreeBuffer()." :enew\<CR>"
nnoremap <expr> <leader>c LeaveNERDTreeBuffer()." :bprevious \<BAR> bdelete #\<CR>"

" break arrow keys habit
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>

" navigate wrapped lines properly
nnoremap j gj
nnoremap k gk

" easy window naigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" efficiency tips
nnoremap ; :
nnoremap ! :!

" scroll & cursor bind
nnoremap <Leader>s :set scrollbind!<CR>:set cursorbind!<CR>

