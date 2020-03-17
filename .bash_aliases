#!/bin/bash
alias ll='ls -lFh'

alias makevenv='deactivate || true ; rm -rf venv-** || true ; python -m venv venv-$(basename "$PWD") && . venv-$(basename "$PWD")/bin/activate && pip install --quiet --upgrade pip && pip install --quiet --requirement requirements.txt'

export SLUGIFY_USES_TEXT_UNIDECODE=yes

function toolbox() {
    #--publish 8000:8000 \
  docker run \
    --interactive \
    --tty \
    --user `id --user`:`id --group` \
    --volume /etc/passwd:/etc/passwd \
    --volume /etc/shadow:/etc/shadow \
    --volume /etc/group:/etc/group \
    --volume /etc/sudoers:/etc/sudoers \
    --volume $HOME/.bashrc:/home/user/.bashrc \
    --volume $HOME/.bash_aliases:/home/user/.bash_aliases \
    --volume $HOME/.bash_aliases-sensitive:/home/user/.bash_aliases-sensitive \
    --volume $HOME/.bash_profile:/home/user/.bash_profile \
    --volume $HOME/.gitconfig:/home/user/.gitconfig \
    --volume $HOME/.tmux.conf:/home/user/.tmux.conf \
    --volume $HOME/.vimrc:/home/user/.vimrc \
    --volume $HOME/.aws/:/home/user/.aws/ \
    --volume $HOME/.kube/:/home/user/.kube/ \
    --volume $HOME/.ssh/:/home/user/.ssh/ \
    --volume $HOME/src/:/home/user/src/ \
    --workdir /home/user/src/ \
    mpdred/toolbox
}

alias psproc='ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu'
alias gitlog='watch --color git log --all --decorate --graph --color=always'
alias k='kubectl'
source <(kubectl completion bash | sed 's/kubectl/k/g')
alias kns='kubectl config set-context --current --namespace'
alias kget='kubectl get $(kubectl api-resources --verbs=list -o name | paste -sd, -) --ignore-not-found'
alias awsecr='aws ecr get-login-password | \
    docker login \
        --username AWS \
        --password-stdin \
            $(aws sts get-caller-identity | jq -r .Account).dkr.ecr.us-east-2.amazonaws.com'
