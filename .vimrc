" == GENERAL ==

if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif


" enable filetype plugins
filetype on
"filetype indent on
filetype plugin on

" set to autoread when a file is changed from outside
set autoread


" == USER INTERFACE ==


" menu has tab completion
set wildmenu

" always show current position
set ruler

" show line numbers
"set number

" show character limit
"set colorcolumn=120

" highlight current line
"set cursorline

" show matching brackets when text indicator is over them
set showmatch

" keep at least 5 lines above/below and left/right
set scrolloff=10
set sidescrolloff=10

" make cursor move as expected with wrapped lines
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
nnoremap k gk
nnoremap j gj

" no error bells
set noerrorbells

" turn on highlighting for searched expressions
set hlsearch
" case-insensitive search
set ignorecase
set incsearch

" blink matching characters for .x seconds
set matchtime=5

" == COLOURS AND FONTS ==


" enable syntax highlighting
syntax on

"set background=light
"set background=dark
"colorscheme desert



" == FILES, BACKUPS AND UNDO ==


" turn backup off
set nobackup
set nowb
set noswapfile


" == TEXT, TAB AND INDENT RELATED ==

"make backspace work like most other apps
set backspace=indent,eol,start

" use spaces instead of tabs
set expandtab

" be smart when using tabs
"set smarttab

" 1 tab == n spaces
set shiftwidth=2
set tabstop=2

"set ai " auto indent
"set si " smart indent
set wrap " wrap lines
set nolist " shows invisible characters; if disabled, undoes linewrap
set linebreak " breaks the line
set showbreak=\ \ \ \ "

" show trailing whitespace
highlight ws ctermbg=red guibg=red
match ws /\s\+$/
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()


" navigate between soft lines
map <silent> <k> gk
"imap <silent> <k> <C-o>gk
map <silent> <j> gj
"imap <silent> <j> <C-o>gj

map <silent> ^ g<home>
"imap <silent> ^ <C-o>g<home>
map <silent> $ g<End>
"imap <silent> $ <C-o>g<End>

" execute the current python file
"map <F5> <Esc>:w<CR>:!clear;python3 %<CR>
"imap <F5> <Esc>:w<CR>:!clear;python3 %<CR>

" Firefox-like tab navigation
"nmap <C-S-tab> :tabprevious<CR>
"nmap <C-Tab>   :tabnext<CR>
"nmap <C-t>     :tabnew<CR>
"nmap <C-w>     :tabclose<CR>
