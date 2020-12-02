""""""""""""
" Plugins
""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
Plug 'ghifarit53/tokyonight-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
call plug#end()

""""""""""""
" Config
""""""""""""
set clipboard=unnamed

" Swap files
set directory^=$HOME/.vim/tmp//

" Theme
syntax on
set background=dark
set ruler
set termguicolors
let g:tokyonight_style='storm'
let g:tokyonight_enable_italic = 1

colorscheme tokyonight
set updatetime=100

" Backspace
set backspace=2

" Mouse
set mouse=a
set ttymouse=xterm2

" Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Line numbers
set number
set relativenumber

" Terminal
set ttyfast
set lazyredraw

function! NumberToggle()
  if(&relativenumber == 1 && &number == 1)
    set number
    set norelativenumber
  elseif (&number == 1 && &relativenumber == 0)
    set norelativenumber
    set nonumber
  else
    set number
    set relativenumber
  endif
endfunc

" File explorer
let  g:netrw_banner=0
let g:netrw_winsize=25

" Search
set path+=**
set wildignore+=**/node_modules/*,**/bower_components/*,**/dist/**,**/public/**,yarn.lock,release/**,build/**
set hlsearch
set ignorecase
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" IDE
let g:ale_set_balloons = 1
let g:ale_fixers = {
\   'javascript': ['prettier'],
\}
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'rust': ['rls'],
\}

let g:ale_sign_error = '|'
let g:ale_sign_warning = '|'

" Color tweak
hi ALEErrorSign ctermbg=235 ctermfg=203
hi ALEWarningSign ctermbg=235 ctermfg=226

" XML
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

""""""""""""
" Shortcuts
""""""""""""

" leader key (Space)
let mapleader = "\<Space>"

" edit this file (F1)
noremap <F1> :vsplit ~/.vimrc<CR>

" open the terminal (F2)
noremap <F2> :terminal<CR>

let s:uname = system("echo -n \"$(uname)\"")
if !v:shell_error && s:uname == "Darwin"
  " move to next window (Alt-l)
  nnoremap ¬ <C-w>w

  " move to previous window (Alt-h)
  nnoremap ˙ <C-w>W 

  " move to the window above (Alt-k)
  nnoremap ˚ <C-w>k

  " move to the window above (Alt-j)
  nnoremap ∆ <C-w>j
else
  " move to next window (Alt-l)
  nnoremap l <C-w>w

  " move to previous window (Alt-h)
  nnoremap <M-h> <C-w>W 

  " move to the window above (Alt-k)
  nnoremap <M-k> <C-w>k

  " move to the window above (Alt-j)
  nnoremap <M-j> <C-w>j
endif

" indent (Ctrl-l)
nnoremap <C-l> <Esc>>>

" unindent (Ctrl-h)
nnoremap <C-h> <Esc><<

" cycle to next buffer (Leader-])
nnoremap <Leader>] :bnext<CR>

" cycle to previous buffer (Leader-[)
nnoremap <Leader>[ :bprevious<CR>

" list buffers (Leader-b)
nnoremap <Leader>b :Buffers<CR>

" first buffer (Leader-1)
nnoremap <Leader>1 :1b<CR>

" second buffer (Leader-2)
nnoremap <Leader>2 :2b<CR>

" third buffer (Leader-3)
nnoremap <Leader>3 :3b<CR>

" fourth buffer (Leader-4)
nnoremap <Leader>4 :4b<CR>

" fifth buffer (Leader-5)
nnoremap <Leader>5 :5b<CR>

" sixth buffer (Leader-6)
nnoremap <Leader>6 :6b<CR>

" seventh buffer (Leader-7)
nnoremap <Leader>7 :7b<CR>

" eighth buffer (Leader-8)
nnoremap <Leader>8 :8b<CR>

" ninth buffer (Leader-9)
nnoremap <Leader>9 :9b<CR>

" tenth buffer (Leader-0)
nnoremap <Leader>10 :10b<CR>

" close window (Leader-Esc)
nnoremap <Leader><Esc> <C-w>c

" close other windows (Leader-o)
nnoremap <Leader>o <C-w>o

" Open vertical split (Leader-v)
nnoremap <silent> <Leader>v :vs<CR>

" Open horizontal split (Leader-s)
nnoremap <silent> <Leader>s :sp<CR>

" save buffer (Leader-w)
nnoremap <Leader>w :w<CR>

" cycle line number mode (Leader-l)
nnoremap <Leader>l :call NumberToggle()<CR>

" toggle search highlight (C-h)
noremap <C-h> :set hlsearch! hlsearch?<CR>

" grep file contents (Leader-g)
nnoremap <Leader>g :Ag<CR> 

" search file names (Leader-f)
nnoremap <Leader>f :Files<CR>

" move line down (C-j)
nnoremap <C-j> ddp
inoremap <C-j> <esc>ddp i

" move line up (C-k)
nnoremap <C-k> kddpk
inoremap <C-k> <esc>kddpk i

" format json (Leader-J)
noremap <Leader>J :.!python -m json.tool<CR>

" remove trailing whitespace (Leader--)
nnoremap <silent> <Leader>- :%s/\s\+$//g<CR>:w<CR> <C-o>

" refresh (F5)
nnoremap <silent> <F5> :edit!<CR>
inoremap <silent> <F5> <ESC>:edit!<CR>i

" Comment (Ctrl-c)
nnoremap <silent> <C-c> :Commentary<CR>

" e-prime search (Leader-e)
nnoremap <silent> <Leader>E :set hlsearch<CR>/\
      \<be\>\\|\
      \<being\>\\|\
      \<is\>\\|\
      \<isn't\>\\|\
      \<are\>\\|\
      \<aren't\>\\|\
      \<was\>\\|\
      \<wasn't\>\\|\
      \<were\>\\|\
      \<weren't\>\\|\
      \<been\><CR>

" File explorer (Ctrl-\)
nnoremap <silent> <C-\> :Lexplore <CR>

" Prettier (gp)
nnoremap <silent> gp :%!prettier --stdin-filepath %<CR>

" Go to Definition (Ctrl-d)
nnoremap <silent> <C-]> :ALEGoToDefinition<CR>

"Find References (Ctrl-/)
nnoremap <silent> ‘ :ALEFindReferences<CR>
