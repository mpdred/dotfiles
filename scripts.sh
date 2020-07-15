#!/usr/bin/env bash
set -euo pipefail

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

test -d ~/bin || mkdir -p ~/bin

scripts=( "pwd_short" "git_prompt" )
for script in "${scripts[@]}";do
    rm -v "${HOME}/bin/scripts/$script" 2>/dev/null || true
	ln -sfv "${dir}/$script" "${HOME}/bin"
    chmod -v +x ${HOME}/bin/${script}
done
