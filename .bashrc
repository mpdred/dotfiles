#!/bin/bash

. /etc/skel/.bashrc

function nonzero_return() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] && echo "$RETVAL "
}

export PS1="\`nonzero_return\`$ "

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_aliases-sensitive ]; then
    . ~/.bash_aliases-sensitive
fi

complete -C /usr/local/bin/aws_completer aws
complete -C $HOME/bin/terraform terraform
source <(kubectl completion bash)
source <(helm completion bash)
#source <(eksctl completion bash)
#source <(kind completion bash)
#source <(kubeless completion bash)


#export KUBECONFIG=$HOME/.kube/config
#for filename in $HOME/.kube/*.yaml; do
#  export KUBECONFIG=$KUBECONFIG:$filename
#done

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

#if [ -z "$TMUX" ] && tty -s; then
#    tmux attach -t default || tmux new -s "$(git rev-parse --abbrev-ref HEAD)-$(basename `git rev-parse --show-toplevel` | sed 's/\./_/g')"
#fi
