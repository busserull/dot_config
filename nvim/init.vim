""""""""""""""""""""
"" Basic setup
""""""""""""""""""""

" Enable lexical highlighting, keeping color settings
syntax enable
filetype plugin indent on

set encoding=utf-8                          " Not actually needed, for completion
set fileencoding=utf-8                      " Save files as UTF-8
set fileencodings=utf-8                     " Only consider UTF-8 when opening files
set fileformat=unix                         " eol == nl

set backspace=indent,eol,start              " Intuitive backspace

set noswapfile                              " Keep buffers in memory only
set showcmd                                 " Show command at bottom of window
set showmode                                " Show mode at bottom of window
set ruler                                   " Show cursor position

set number                                  " Show current line number
set relativenumber                          " Show numbers relative to current
set foldcolumn=1                            " Show folds in left column
set scrolloff=3                             " Show 3 lines above and below line

set autoread                                " Re-read files changing outside vim
set hidden                                  " Hide buffers when abandoned

set termguicolors                           " Enable 24-bit RGB colors in TUI
set cursorline                              " Highlight current line

set linebreak                               " Wrap lines at linebreak

set tabstop=4                               " One tab is four spaces
set shiftwidth=4                            " Default indent level four spaces
set expandtab                               " Convert inserted tabs to spaces

set undolevels=1000                         " Actions remembered (default)
set history=1000                            " Commands remembered (default)
set undofile                                " Enable persistent undo
set undodir=$HOME/.local/share/nvim/undo    " Store undo history

set wildmenu                                " Display menu for <tab> autocompletion

" Saner wildmenu navigation
set wildcharm=<c-z>
cnoremap <expr> <up> getcmdline()[:1] is 'e ' && wildmenumode()
            \? "\<left>" : "\<up>"
cnoremap <expr> <down> getcmdline()[:1] is 'e ' && wildmenumode()
            \? "\<right>" : "\<down>"
cnoremap <expr> <left> getcmdline()[:1] is 'e ' && wildmenumode()
            \? "\<up>" : "\<left>"
cnoremap <expr> <right> getcmdline()[:1] is 'e ' && wildmenumode()
            \? " \<bs>\<C-Z>" : "\<right>"


set title                                   " Set title of terminal
set tabpagemax=40                           " Allow 40 tabs from command line
set noerrorbells                            " Do not ring on errors
set mouse=a                                 " Allow scrolling and selecting

set autoindent                              " Inherit indentation from last line
set nowrap                                  " Do not wrap long lines
set confirm                                 " Ask to save unwritten buffers
set nrformats=bin,hex                       " Ctrl-A Ctrl-X only on bin and hex

""""""""""""""""""""
"" Custom maps
""""""""""""""""""""

let mapleader = ";"

" Leave terminal mode
tnoremap <esc> <c-\><c-n>
tnoremap <c-w><c-h> <c-\><c-n><c-w><c-h>
tnoremap <c-w>h <c-\><c-n><c-w><c-h>
tnoremap <c-w><left> <c-\><c-n><c-w><c-h>
tnoremap <c-w><c-s> <c-\><c-n><c-w><c-l>
tnoremap <c-w>s <c-\><c-n><c-w><c-l>
tnoremap <c-w><right> <c-\><c-n><c-w><c-l>
tnoremap <c-w><c-j> <c-\><c-n><c-w><c-j>
tnoremap <c-w>j <c-\><c-n><c-w><c-j>
tnoremap <c-w><down> <c-\><c-n><c-w><c-j>
tnoremap <c-w><c-k> <c-\><c-n><c-w><c-k>
tnoremap <c-w>k <c-\><c-n><c-w><c-k>
tnoremap <c-w><up> <c-\><c-n><c-w><c-k>
tnoremap <c-w><c-p> <c-\><c-n><c-w><c-p>
tnoremap <c-w>p <c-\><c-n><c-w><c-p>

" Swap window from insert mode
inoremap <c-w><c-h> <esc><c-w><c-h>
inoremap <c-w>h <esc><c-w><c-h>
inoremap <c-w><c-s> <esc><c-w><c-l>
inoremap <c-w>s <esc><c-w><c-l>
inoremap <c-w><c-j> <esc><c-w><c-j>
inoremap <c-w>j <esc><c-w><c-j>
inoremap <c-w><c-k> <esc><c-w><c-k>
inoremap <c-w>k <esc><c-w><c-k>
inoremap <c-w><c-p> <esc><c-w><c-p>
inoremap <c-w>p <esc><c-w><c-p>

" Hide search highlights
nnoremap <leader>/ :nohl<cr>

" Use jk to exit insert mode
inoremap jk <esc>

" Ergonomic navigation
nnoremap s <right>
vnoremap s <right>
nnoremap l <nop>
vnoremap l <nop>

" Match brackets
inoremap {<cr> {<cr>}<esc>O
inoremap (<cr> (<cr>)<esc>O
inoremap [<cr> [<cr>]<esc>O

" Ctrl to temporarily move in insert mode
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-s> <right>

" Indent and unindent
inoremap <c-l> <c-t>
inoremap <c-g> <c-d>
inoremap <c-t> <nop>
inoremap <c-d> <nop>
nnoremap <c-l> >>
nnoremap <c-g> <<

" Window creation and navigation
nnoremap <c-w><c-l> <nop>
nnoremap <c-w>l <nop>
nnoremap <c-w><c-s> <c-w>l
nnoremap <c-w>s <c-w>l
nnoremap <c-w><c-d> <c-w>s
nnoremap <c-w>d <c-w>s

" Swap between two last buffers
nnoremap <c-b> <c-^>
" Unbind <c-s> and <c-h>
nnoremap <c-s> <nop>
nnoremap <c-h> <nop>
" Scroll through buffers
" nnoremap <c-s> :bnext<cr>
" nnoremap <c-h> :bprev<cr>

" Scroll up and down faster
nnoremap <c-u> 4<c-y>
vnoremap <c-u> 4<c-y>
nnoremap <c-e> 4<c-e>
vnoremap <c-e> 4<c-e>

" Navigate jump motion list
nnoremap <c-h> <c-o>
vnoremap <c-h> <c-o>
nnoremap <c-s> <c-i>
vnoremap <c-s> <c-i>
nnoremap <c-o> <nop>
vnoremap <c-o> <nop>
nnoremap <c-i> <nop>
vnoremap <c-i> <nop>

" Position current location to screen middle
inoremap <c-z> <c-o>zz

" Yank full line
nnoremap Y yy

" Change whole line with <c-C>
nnoremap <c-C> cc

" Unbind keys for closing window
nnoremap ZZ <nop>
nnoremap ZQ <nop>

" Show matches on center of screen
nnoremap n nzz
nnoremap N Nzz

" Toggle spelling
nnoremap <leader>s :set spell!<cr>

" Allow dot command to be used in visual mode
vnoremap . :normal . <cr>

" Move visual selections up or down
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

" Unbind join lines
nnoremap J <nop>

" Spell checking
" set spell
" set spelllang=en,no

" Search for visually selected text
vnoremap // y/\V<c-R>=escape(@",'/\')<cr><cr>

""""""""""""""""""""
"" File explorer
""""""""""""""""""""

let g:netrw_banner = 0                      " Hide netrw banner
let g:netrw_liststyle = 0                   " Show only current directory
let g:netrw_browse_split = 0                " Open files in same window


""""""""""""""""""""
"" Search behavior
""""""""""""""""""""

set incsearch                               " Find next match while typing
set hlsearch                                " Highlight search matches
set ignorecase                              " Ignore case while searching
set smartcase                               " Unless capital letters are used

" Use 'very magic' mode for searching
nnoremap / /\v
vnoremap / /\v


""""""""""""""""""""
"" Spelling
""""""""""""""""""""

set spelllang=en_us,nb
set nospell                                 " Spelling off by default


""""""""""""""""""""
"" Default filetype
""""""""""""""""""""

set filetype=unix

""""""""""""""""""""
"" Visual setup
""""""""""""""""""""

set background=dark
hi Normal guibg=NONE ctermbg=NONE

" Statusline
set statusline=2                            " Always display statusline
set statusline=%m%r%F%=%y\ (Line\ %l\/%L\ col\ %c)
" %m                                        " Modified flag
" %r                                        " Read only flag
" %F                                        " Full path of file in buffer
" %=                                        " Separation of sectors
" %y                                        " Type of file in buffer [vim]
" %Y                                        " Type of file in buffer ,VIM
" %l                                        " Current line in buffer
" %L                                        " Number of lines in buffer
" %c                                        " Column number
