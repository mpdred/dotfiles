#!/usr/bin/env bash
set -euo pipefail

dotfiles=( ".bashrc" ".bash_aliases" ".gitconfig" ".gitignore_global" ".vimrc" ".tmux.conf" )
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

for dotfile in "${dotfiles[@]}";do
    rm -v "${HOME}/$dotfile" 2>/dev/null || true
	ln -sfv "${dir}/${dotfile}" "${HOME}"
done

/bin/bash scripts.sh
