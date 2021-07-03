"""""""""
" General
"""""""""
set history=500
filetype plugin on
filetype indent on

"""""""""""
" Variables
"""""""""""
let mapleader = ","

""""
" UI
""""
let so=10
let $LANG='en'
set langmenu=en

colorscheme pablo

" super cool auto-complete menu
set wildmenu

" show line and column number of cursor
set ruler
set number

" height of command line
set cmdheight=1

" auto-hide 'abandoned' buffers
set hidden

" configure backspace behavior
set backspace=start,indent

" allow moving between lines w/ arrow keys. But like... don't use the arrow
" keys
set whichwrap=[,],<,>

" highlight search results
set hlsearch

" don't re-draw the screen when executing macros for SPEED
set lazyredraw

" Regex search
set magic

" highlight matching brackets
set showmatch

" match blinking rate (* 1/10 of second)
set mat=2

" turn off bad sounds on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" some margin on the left
set foldcolumn=1

""""""""""""""""""
" Colors and fonts
""""""""""""""""""
" enable syntax highlighting
syntax enable

" terminal colors
set t_Co=256

" dark bg, obs
set background=dark

set encoding=utf8

set ffs=unix,dos,mac

""""""""""""""""""""""
" Files, Backups, Undo
""""""""""""""""""""""
" set nobackup
" set nowb
" set noswapfile

"""""""""""""""""""
" Text, Tab, Indent
"""""""""""""""""""
" tabs are spaces
set expandtab

" using tab shifts to the next modulo col of tabwidth
set smarttab

set shiftwidth=4
set tabstop=4

" don't automatically wrap lines ever
set tw=0

" auto indent
set autoindent
set smartindent

""""""""""""""""""""""
" Visual mode settings
""""""""""""""""""""""
" Press * or # to search for current selection
vnoremap <silent> * : <C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # : <C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

hi StatusLine ctermbg=black ctermfg=green


""""""""""""""""
" Spell checking
""""""""""""""""
" Press <leader>ss to toggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using leader
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


""""""""""""""""""
" Helper Functions
""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" get visual selection
function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction






