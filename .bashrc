#!/bin/bash

. /etc/skel/.bashrc

export SLUGIFY_USES_TEXT_UNIDECODE=yes

# Set history format
export HISTTIMEFORMAT="%h %Y/%m/%d %H:%M:%S "

# Increase history size (0 zero disables the history list, value less than zero causes the history list to be unlimited)
export HISTSIZE=-1
export HISTFILESIZE=-1

# To append commands to the history file, rather than overwrite it
shopt -s histappend

# Save each command in history right after it has been executed
PROMPT_COMMAND='history -a'

# Value         Description
# ignorespace   don’t save lines which begin with a <space> character
# ignoredups    don’t save lines matching the previous history entry
# ignoreboth    use both ‘ignorespace’ and ‘ignoredups’
# erasedups     eliminate duplicates across the whole history
export HISTCONTROL=ignoredups:erasedups

# Don’t save ls, ps and history commands:
export HISTIGNORE="ls:ps:history:pwd:cd:cat:tree"


if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f ~/.bash_aliases-sensitive ]; then
  . ~/.bash_aliases-sensitive
fi

if [ -f ~/.bash_bindings ]; then
  . ~/.bash_bindings
fi

if [ -f ~/.fzf.bash ] ; then
  . ~/.fzf.bash
fi

export EDITOR=vim
export VISUAL=vim
export PATH=$HOME/.local/bin:$PATH
export GOBIN=/usr/bin/go
export GOROOT=/usr/lib/go-1.14
export PATH=$PATH:$GOPATH/bin
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export DOCKER_BUILDKIT=1


# completions
complete -C "$(which aws_completer)" aws
complete -C "$(which terraform)" terraform
source <(kubectl completion bash)
source <(helm completion bash)
source <(kind completion bash)
#source <(eksctl completion bash)
#source <(kubeless completion bash)


#export KUBECONFIG=$HOME/.kube/config
#for filename in $HOME/.kube/*.yaml; do
#  export KUBECONFIG=$KUBECONFIG:$filename
#done

# --------

COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"
COLOR_BOLD="\033[1m"

function nonzero_return() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] \
    && echo "$RETVAL "
}

function timer_start {
  timer=${timer:-$SECONDS}
}

function timer_stop {
  timer_show=$(($SECONDS - $timer))
  unset timer
}

trap 'timer_start' DEBUG
PROMPT_COMMAND=timer_stop

PS1="\[$COLOR_RESET\]"
PS1+="\n#"
PS1+="\[$COLOR_BOLD\]"

PS1+=" \D{%H:%M:%S} "
PS1+="\s "
PS1+='(T+${timer_show}s) '


PS1+="${COLOR_RED}"
PS1+="\`nonzero_return\`"
PS1+="${COLOR_RESET}"
PS1+="\[$COLOR_BOLD\]"

PS1+="\$ \n"   # '#' for root, else '$'
PS1+="\[$COLOR_RESET\]"

export PS1


export BAT_THEME=ansi-light
