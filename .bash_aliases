#!/bin/bash

alias ll='ls -lFh'

alias awsecr='aws ecr get-login-password | \
    docker login \
        --username AWS \
        --password-stdin \
            $(aws sts get-caller-identity | jq -r .Account).dkr.ecr.us-east-2.amazonaws.com'
awkn() {
  awk -F ' ' '{print $var}' var="$1"
}
alias bat='bat -p'
alias batt='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}
alias gitlog='watch --color git log --all --decorate --graph --color=always'
alias k='kubectl'
source <(kubectl completion bash | sed 's/kubectl/k/g')
alias kns='kubectl config set-context --current --namespace'
alias kget='kubectl get $(kubectl api-resources --verbs=list -o name | paste -sd, -) --ignore-not-found'
alias psproc='ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu'
