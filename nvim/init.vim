""""""""""""""""""""
"" Packages
""""""""""""""""""""
"
" Packages can be handled by vim internally
" Check :help packages
"
" For example
" mkdir -p ~/.local/share/nvim/site/pack/gruvbox/start/gruvbox
" git clone https://github.com/morhetz/gruvbox .../gruvbox

"""""""""""""""""""""
"" Plug
""""""""""""""""""""

call plug#begin()

Plug 'morhetz/gruvbox'                      " Colorscheme
Plug 'tpope/vim-commentary'                 " gc(c) to comment out/in
Plug 'tpope/vim-endwise'                    " Auto-end structures

Plug 'vim-airline/vim-airline'              " Pretty statusline
Plug 'vim-airline/vim-airline-themes'

Plug 'airblade/vim-gitgutter'               " Git lines added/removed
Plug 'Yggdroot/indentLine'                  " Mark indent levels
Plug 'w0rp/ale'                             " Asynchronous Lint Engine
Plug 'sheerun/vim-polyglot'                 " Language support
Plug 'psf/black'                            " Python black

call plug#end()

""""""""""""""""""""
"" Plug config
""""""""""""""""""""

let g:ale_lint_on_text_changed = 'never'    " Lint on save and open only
let g:airline#extension#ale#enabled = 1
let g:rustfmt_autosave = 1

let g:user_emmet_leader_key = ','

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


""""""""""""""""""""
"" File explorer
""""""""""""""""""""

let g:netrw_banner = 0                      " Hide netrw banner
let g:netrw_liststyle = 0                   " Show only current directory
let g:netrw_browse_split = 0                " Open files in same window

" Toggle netrw
" nnoremap <leader>f :40vs +Explore<cr>


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
"" Filetype specific
""""""""""""""""""""
autocmd BufWritePre *.py execute ':Black'
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2

""""""""""""""""""""
"" Visual setup
""""""""""""""""""""

" Colorscheme
let g:gruvbox_bold=1
let g:gruvbox_italic=1
let g:gruvbox_underline=1
let g:gruvbox_undercurl=1
let g:gruvbox_contrast_dark='soft'
let g:gruvbox_hls_cursor='blue'
let g:gruvbox_sign_column='bg1'
let g:gruvbox_color_column='bg1'
let g:gruvbox_vert_split='bg0'
let g:gruvbox_italicize_comments=1
let g:gruvbox_italicize_strings=0
let g:gruvbox_invert_selection=0
let g:gruvbox_invert_signs=0
let g:gruvbox_invert_indent_guides=0
let g:gruvbox_invert_tabline=0
let g:gruvbox_improved_strings=0
let g:gruvbox_improved_warnings=0

set background=dark
colorscheme gruvbox
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

" Vim-airline
let g:airline_theme = 'angr'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = '>'
let g:airline_right_sep = ''
let g:airline_right_alt_sep = '<'
let g:airline_symbols.branch = 'B'
let g:airline_symbols.readonly = 'RO'
let g:airline_symbols.crypt = 'C'
let g:airline_symbols.linenr = 'Line '
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.paste = 'P'
let g:airline_symbols.spell = 'S'
let g:airline_symbols.notexists = 'x'
let g:airline_symbols.whitespace = ' '
