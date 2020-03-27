#!/bin/bash

. /etc/skel/.bashrc

export SLUGIFY_USES_TEXT_UNIDECODE=yes

# Set history format
#export HISTTIMEFORMAT="%h %Y/%m/%d %H:%M:%S "

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
export HISTIGNORE="ls:ps:history:pwd"

function nonzero_return() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] && echo "$RETVAL "
}

PS1="\s \`nonzero_return\`\$ "

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
export PATH=$HOME/bin:$PATH
export GOPATH=$HOME/go
export GOBIN=/usr/local/go/bin
export GOROOT=/usr/local/go
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export DOCKER_BUILDKIT=1


# completions
complete -C $(which aws_completer) aws
complete -C $(which terraform) terraform
source <(kubectl completion bash)
source <(helm completion bash)
source <(kind completion bash)
#source <(eksctl completion bash)
#source <(kubeless completion bash)


#export KUBECONFIG=$HOME/.kube/config
#for filename in $HOME/.kube/*.yaml; do
#  export KUBECONFIG=$KUBECONFIG:$filename
#done
