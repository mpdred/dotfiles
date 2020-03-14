#!/bin/bash
set -e
set -x

dotfiles=( ".bashrc" ".bash_aliases" ".vimrc" ".tmux.conf" )
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

for dotfile in "${dotfiles[@]}";do
    rm -v "${HOME}/$dotfile" || true
	ln -sf "${dir}/${dotfile}" "${HOME}"
done
