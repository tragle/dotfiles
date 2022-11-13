call plug#begin('~/.vim/plugged')
Plug 'itchyny/vim-gitbranch'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'tpope/vim-commentary'
Plug 'ghifarit53/tokyonight-vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
call plug#end()

""""""""""""
" Config
""""""""""""
set clipboard=unnamed
set hidden
set noerrorbells visualbell t_vb=

" Swap files
set directory^=$HOME/.vim/tmp//

set autoread

" Theme
syntax on
set background=dark
set ruler
set termguicolors
color tokyonight
set hlsearch
hi Search ctermbg=DarkGray
hi Search ctermfg=LightGray


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
tnoremap  <C-\><C-\> <C-\><C-n>

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

" Set the title of the Terminal to the currently open file
function! SetTerminalTitle()
    let titleString = expand('%:t')
    if len(titleString) > 0
        let &titlestring = expand('%:t')
        " this is the format iTerm2 expects when setting the window title
        let args = "\033];".&titlestring."\007"
        let cmd = 'silent !echo -e "'.args.'"'
        execute cmd
        redraw!
    endif
endfunction

autocmd BufEnter * call SetTerminalTitle()

" File explorer
let g:netrw_banner=0
let g:netrw_winsize=25

" Search
set path+=**
set wildignore+=**/node_modules/*,**/bower_components/*,**/dist/**,**/public/**,yarn.lock,release/**,build/**
set hlsearch
set noignorecase
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Coc
" set signcolumn=yes
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


autocmd CursorHold * call CocActionAsync('highlight')

" Use ? to show documentation in preview window.
nnoremap <silent> ? :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('?', 'in')
  endif
endfunction

let g:signify_sign_add = '●'
let g:signify_sign_change = '◍'
let g:signify_sign_delete = '○'
let g:signify_sign_delete_first_line = '◒'

" status line
set laststatus=2
set statusline=
" set statusline+=%#PmenuSel#
set statusline+=%{gitbranch#name()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
" set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %p%%
set statusline+=\ %l:%c

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

" Comment (Ctrl-/)
noremap <silent> <C-_> :Commentary<CR>

" File explorer (Ctrl-\)
nnoremap <silent> <C-\> :Lexplore <CR>

" Go to Definition (Ctrl-d)
nnoremap <silent> <C-]> :call CocActionAsync('jumpDefinition')<CR>

" Open command list
nnoremap <silent> <C-p> :CocCommand<CR>

" Diff current line
nnoremap <Leader>d :SignifyHunkDiff<CR>
