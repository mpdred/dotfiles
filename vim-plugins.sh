#!/usr/bin/env bash
set -euo pipefail

#rm -rfv ~/.vim ~/.vimrc 2>/dev/null || true
#git checkout -- .vimrc 2>/dev/null || true

test -d ~/.vim || mkdir -p ~/.vim/autoload ~/.vim/bundle

# Pathogen.vim
test -f ~/.vim/autoload/pathogen.vim \
    || cat >> .vimrc << EOF


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


# hashivim/vim-terraform
test -d ~/.vim/bundle/vim-terraform || cat >> .vimrc << EOF


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
test -d ~/.vim/bundle/rainbow || cat >> .vimrc << EOF


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
test -d ~/.vim/bundle/nerdcommenter || cat >> .vimrc << EOF

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
test -d ~/.vim/bundle/synstastic || cat >> .vimrc << EOF

" = nerdtree =
"
" navigate between vim windows with Ctrl + w + w

" key binding for showing/hiding the tree
map <C-n> :NERDTreeToggle<CR>

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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
test -d ~/.vim/bundle/synstastic || cat >> .vimrc << EOF


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
