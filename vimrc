" leader key
let mapleader=" "

execute pathogen#infect()
" cd ~/.vim/bundle ; git submodule foreach git pull origin master

set nocompatible
set shortmess+=I
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

" matchit
runtime macros/matchit.vim

" search
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap / /\v
vnoremap / /\v
nnoremap <leader>h :noh<cr>

" folding
let ruby_fold = 1
set foldmethod=indent
set foldlevelstart=2
set foldcolumn=3

" completion
set completeopt=menu,longest,preview

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme = 'zenburn'

" syntax highlighting
syntax on
let ruby_operators = 1

" color scheme
set t_Co=256
colors zenburn
let g:zenburn_high_Contrast = 1
" let g:zenburn_disable_Label_underline = 0
" let g:zenburn_transparent = 0
" let g:zenburn_old_Visual = 1
" let g:zenburn_force_dark_Background = 1
" let g:zenburn_alternate_Visual = 1
" solid vertical bar
set fillchars=vert:\│
" highlight matching parens
" hi MatchParen ctermfg=Magenta ctermbg=234
" no background highlight for folds 
" hi Folded ctermbg=234
" hi Visual ctermbg=237

" file browser
" FIX: keep tree open after opening file when started with 'vim .' : open primary instead of secondary tree ?
" nerdtree/autoload/nerdtree.vim : function! nerdtree#checkForBrowse(dir) : call g:NERDTreeCreator.CreatePrimary(a:dir)
" did not work properly - created a visible buffer/tab for NERDTree
let NERDTreeQuitOnOpen = 0
nnoremap <Leader>d :NERDTreeToggle<CR>

" tags
nnoremap <Leader>t :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1
"highlight TagbarHighLight ctermfg=black ctermbg=darkyellow

" tags for rvm current ruby stdlib
autocmd FileType ruby 
			\ let &tags .= "," . $MY_RUBY_HOME . "/lib/tags" |
			\ let &path .= "," . $MY_RUBY_HOME . "/lib"

" ag
let g:ag_prg="ag --column --nogroup --noheading --nobreak"
let g:ag_qhandler="rightbelow copen"
let g:ag_highlight=1

" slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": ":2"}

" xml folding
augroup XML
  autocmd!
  autocmd FileType xml setlocal foldmethod=indent foldlevelstart=999 foldminlines=0
augroup END

" buffers on tabline
set hidden
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
function LeaveNERDTree()
  if @% =~ '^NERD_tree'
    wincmd l
  endif
endfunction
command -bar LeaveNERDTree call LeaveNERDTree()
nnoremap <leader>1 :LeaveNERDTree <BAR> execute "normal \<Plug>AirlineSelectTab1"<CR>
nnoremap <leader>2 :LeaveNERDTree <BAR> execute "normal \<Plug>AirlineSelectTab2"<CR>
nnoremap <leader>3 :LeaveNERDTree <BAR> execute "normal \<Plug>AirlineSelectTab3"<CR>
nnoremap <leader>4 :LeaveNERDTree <BAR> execute "normal \<Plug>AirlineSelectTab4"<CR>
nnoremap <leader>5 :LeaveNERDTree <BAR> execute "normal \<Plug>AirlineSelectTab5"<CR>
nnoremap <leader>6 :LeaveNERDTree <BAR> execute "normal \<Plug>AirlineSelectTab6"<CR>
nnoremap <leader>7 :LeaveNERDTree <BAR> execute "normal \<Plug>AirlineSelectTab7"<CR>
nnoremap <leader>8 :LeaveNERDTree <BAR> execute "normal \<Plug>AirlineSelectTab8"<CR>
nnoremap <leader>9 :LeaveNERDTree <BAR> execute "normal \<Plug>AirlineSelectTab9"<CR>
nnoremap <Leader>- :LeaveNERDTree <BAR> bprevious<CR>
nnoremap <Leader>= :LeaveNERDTree <BAR> bnext<CR>
nnoremap <Leader>n :LeaveNERDTree <BAR> enew<CR>
nnoremap <leader>c :LeaveNERDTree <BAR> bprevious <BAR> bdelete #<CR>
nnoremap <leader>l :LeaveNERDTree <BAR> buffers!<CR>
nnoremap <leader>\ :LeaveNERDTree <BAR> b#<CR>

" break arrow keys habit
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" navigate wrapped lines properly
nnoremap j gj
nnoremap k gk

" easy window naigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" sQueeze blank lines
command -range Queeze <line1>,<line2>g/^\s*$/d <BAR> noh
vmap Q :Queeze<CR>

" edit .vimrc
nnoremap <leader>v :edit $MYVIMRC<CR>

" toggle scroll & cursor bind
nnoremap <Leader>s :set scrollbind!<CR>:set cursorbind!<CR>

" Krack line (opposite of Join) keep cursor on same line and column
nnoremap K i<CR><Esc>k$hl

" vim-easy-align
vmap <Enter> <Plug>(EasyAlign)
vmap <TAB> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" splitjoin blocks
nnoremap <leader>j :SplitjoinJoin<CR>
nnoremap <leader>k :SplitjoinSplit<CR>

" vim-togglelist defaults
" let g:toggle_list_copen_command="Copen"
" if !exists("g:toggle_list_no_mappings")
"     nmap <script> <silent> <leader>l :call ToggleLocationList()<CR>
"     nmap <script> <silent> <leader>q :call ToggleQuickfixList()<CR>
" endif

" ctrlp.vim
let g:ctrlp_map = '<leader>p'

" vim-wiki default
" nmap <Leader>ww <Plug>VimwikiIndex

" screen/tmux
let g:ScreenShellInitialFocus = 'shell'
nnoremap <leader>so :ScreenShell<CR>
nnoremap <leader>sv :ScreenShellVertical<CR>
nnoremap <leader>sq :ScreenQuit<CR>
vnoremap <leader>ss :ScreenSend<CR>

" vim-rails
nnoremap <leader>rr :Rake<CR>
nnoremap <leader>rc :Rails console<CR>
nnoremap <leader>rs :Rails server<CR>

" RSpec.vim mappings
map <Leader>tf :call RunCurrentSpecFile()<CR>
map <Leader>tn :call RunNearestSpec()<CR>
map <Leader>tl :call RunLastSpec()<CR>
map <Leader>ta :call RunAllSpecs()<CR>

" Dispatch + Rspec
let g:rspec_command = "Dispatch rspec {spec}"

" Enable seeing-is-believing mappings only for Ruby
augroup seeingIsBelievingSettings
  autocmd!
  autocmd FileType ruby nmap <buffer> <leader>emr <Plug>(seeing-is-believing-mark-and-run)
  autocmd FileType ruby xmap <buffer> <leader>emr <Plug>(seeing-is-believing-mark-and-run)
  autocmd FileType ruby nmap <buffer> <leader>em  <Plug>(seeing-is-believing-mark)
  autocmd FileType ruby xmap <buffer> <leader>em  <Plug>(seeing-is-believing-mark)
  autocmd FileType ruby nmap <buffer> <leader>er  <Plug>(seeing-is-believing-run)
  " autocmd FileType ruby imap <buffer> <F4> <Plug>(seeing-is-believing-mark)
  " autocmd FileType ruby imap <buffer> <F5> <Plug>(seeing-is-believing-run)
augroup END

" FIX: this is supposed to prevent mutliple reloads by webpack-dev-server file watcher while editing before file save
set backupcopy=yes

