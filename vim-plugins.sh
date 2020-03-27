#!/usr/bin/env bash
set -euo pipefail

rm -rfv ~/.vimrc.local ~/.vim 2>/dev/null || true

test -d ~/.vim || mkdir -p ~/.vim/autoload ~/.vim/bundle

# Pathogen.vim
test -f ~/.vim/autoload/pathogen.vim \
    || cat >> ~/.vimrc.local << EOF


" == PLUGINS ==

" Pathogen plugin https://github.com/tpope/vim-pathogen
execute pathogen#infect()
EOF
test -f ~/.vim/autoload/pathogen.vim \
    || curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim \



# airblade/vim-gitgutter
test -d ~/.vim/bundle/vim-gitgutter || /bin/bash << 'EOF'
#!/usr/bin/env bash
set -euo pipefail

URL=https://github.com/airblade/vim-gitgutter
SRC=~/src/github.com/airblade/vim-gitgutter

test -d $SRC || git clone --depth=1 $URL.git $SRC
ln -sfv $SRC ~/.vim/bundle/$(basename $SRC)
EOF


# ctrlpvim/ctrlp.vim
test -d ~/.vim/bundle/ctrlp.vim || cat >> ~/.vimrc.local << EOF


" = ctrlp.vim =
"
" Change the default mapping and the default command to invoke CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" When invoked without an explicit starting directory, CtrlP will set its local working directory according to this variable:
" 'c' - the directory of the current file.
" 'a' - the directory of the current file, unless it is a subdirectory of the cwd
" 'r' - the nearest ancestor of the current file that contains one of these directories or files: .git .hg .svn .bzr _darcs
" 'w' - modifier to "r": start search from the cwd instead of the current file's directory
" 0 or '' (empty string) - disable this feature.
let g:ctrlp_working_path_mode = ''

" Ignore files in '.gitignore'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Open files in a new tab
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }
EOF

test -d ~/.vim/bundle/ctrlp.vim || /bin/bash << 'EOF'
#!/usr/bin/env bash
set -euo pipefail

URL=https://github.com/ctrlpvim/ctrlp.vim
SRC=~/src/github.com/ctrlpvim/ctrlp.vim

test -d $SRC || git clone --depth=1 $URL.git $SRC
ln -sfv $SRC ~/.vim/bundle/$(basename $SRC)
EOF


# hashivim/vim-terraform
test -d ~/.vim/bundle/vim-terraform || cat >> ~/.vimrc.local << EOF


" = vim-terraform =
"
" Allow vim-terraform to align settings automatically with Tabularize.
let g:terraform_align=1
" Allow vim-terraform to automatically format *.tf and *.tfvars files with terraform fmt. You can also do this manually with the :TerraformFmt command.
let g:terraform_fmt_on_save=1
EOF

test -d ~/.vim/bundle/vim-terraform || /bin/bash << 'EOF'
#!/usr/bin/env bash
set -euo pipefail

URL=https://github.com/hashivim/vim-terraform
SRC=~/src/github.com/hashivim/vim-terraform

test -d $SRC || git clone --depth=1 $URL.git $SRC
ln -sfv $SRC ~/.vim/bundle/$(basename $SRC)
EOF


# luochen1990/rainbow
test -d ~/.vim/bundle/rainbow || cat >> ~/.vimrc.local << EOF


" = rainbow =
"

"set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1
EOF

test -d ~/.vim/bundle/rainbow || /bin/bash << 'EOF'
#!/usr/bin/env bash
set -euo pipefail

URL=https://github.com/luochen1990/rainbow
SRC=~/src/github.com/luochen1990/rainbow

test -d $SRC || git clone --depth=1 $URL.git $SRC
ln -sfv $SRC ~/.vim/bundle/$(basename $SRC)
EOF


# preservim/nerdcommenter
test -d ~/.vim/bundle/nerdcommenter || cat >> ~/.vimrc.local << EOF

" = nerdcommenter =
"
" comment lines: select lines and use <Leader> + cc (e.g. \cc)
" uncomment lines: select lines and use <Leader> + cu (e.g. \cc)

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
EOF

test -d ~/.vim/bundle/nerdcommenter || /bin/bash << 'EOF'
#!/usr/bin/env bash
set -euo pipefail

URL=https://github.com/preservim/nerdcommenter
SRC=~/src/github.com/preservim/nerdcommenter

test -d $SRC || git clone --depth=1 $URL.git $SRC
ln -sfv $SRC ~/.vim/bundle/$(basename $SRC)
EOF


# preservim/nerdtree
test -d ~/.vim/bundle/synstastic || cat >> ~/.vimrc.local << EOF

" = nerdtree =
"
" navigate between vim windows with Ctrl + w + w

" key binding for showing/hiding the tree
map <C-n> :NERDTreeToggle<CR>

" open a NERDTree automatically when vim starts up if no files were specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" open NERDTree automatically when vim starts up on opening a directory
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" close vim if the only window left open is a NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" show hidden files
let NERDTreeShowHidden=1
EOF

test -d ~/.vim/bundle/nerdtree || /bin/bash << 'EOF'
#!/usr/bin/env bash
set -euo pipefail

URL=https://github.com/preservim/nerdtree
SRC=~/src/github.com/preservim/nerdtree

test -d $SRC || git clone --depth=1 $URL.git $SRC
ln -sfv $SRC ~/.vim/bundle/$(basename $SRC)
EOF


# vim-syntastic/syntastic
test -d ~/.vim/bundle/synstastic || cat >> ~/.vimrc.local << EOF


" = syntastic =
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
EOF

test -d ~/.vim/bundle/syntastic || /bin/bash << 'EOF'
#!/usr/bin/env bash
set -euo pipefail

URL=https://github.com/vim-syntastic/syntastic
SRC=~/src/github.com/vim-syntastic/syntastic

test -d $SRC || git clone --depth=1 $URL.git $SRC
ln -sfv $SRC ~/.vim/bundle/$(basename $SRC)
EOF


# ycm-core/YouCompleteMe
test -d ~/.vim/bundle/YouCompleteMe || /bin/bash << 'EOF'
#!/usr/bin/env bash
set -euo pipefail

URL=https://github.com/ycm-core/YouCompleteMe
SRC=~/src/github.com/ycm-core/YouCompleteMe

sudo apt update
sudo apt install -y build-essential cmake vim python3-dev 1>/dev/null
test -d $SRC || git clone --depth=1 $URL.git $SRC

test -d ~/.vim/bundle/YouCompleteMe || ln -sfv $SRC ~/.vim/bundle/YouCompleteMe
cd $SRC
git submodule update --init --recursive
./install.sh --clang-completer

ln -sfv $SRC ~/.vim/bundle/$(basename $SRC)
EOF
