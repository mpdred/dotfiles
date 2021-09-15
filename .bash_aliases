#!/bin/bash

# HISTORY
#

export SLUGIFY_USES_TEXT_UNIDECODE=yes

# Set history format
export HISTTIMEFORMAT="%h %Y/%m/%d %H:%M:%S "

# Increase history size (0 zero disables the history list, value less than zero causes the history list to be unlimited)
export HISTSIZE=-1
export HISTFILESIZE=-1

# To append commands to the history file, rather than overwrite it
shopt -s histappend

# Save each command in history right after it has been executed
export PROMPT_COMMAND='history -a'

# Value         Description
# ignorespace   don’t save lines which begin with a <space> character
# ignoredups    don’t save lines matching the previous history entry
# ignoreboth    use both ‘ignorespace’ and ‘ignoredups’
# erasedups     eliminate duplicates across the whole history
export HISTCONTROL=ignoredups:erasedups

# Don’t save ls, ps and history commands:
export HISTIGNORE="ls:ps:history:pwd:cd:cat:tree"


# ---




export EDITOR=vim
export VISUAL=vim
export PATH=$HOME/.local/bin:$PATH

alias ll='ls -lFh'

# PS1
#

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

# Bash only!
# If set to a number greater than zero, the value is used as the number of trailing directory components to retain when expanding the \w and \W prompt string escapes (see Controlling the Prompt). Characters removed are replaced with an ellipsis.
# https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html#index-PROMPT_005fDIRTRIM
export PROMPT_DIRTRIM=3

PS1="\[$COLOR_RESET\]"
PS1+="\n#"
PS1+="\[$COLOR_BOLD\]"

PS1+=" \D{%H:%M:%S} "
PS1+="\[$COLOR_RESET\]"
PS1+='(t+${timer_show}s) '
PS1+="\s "

PS1+="${COLOR_RED}"
PS1+="\`nonzero_return\`"
PS1+="${COLOR_RESET}"
PS1+="\[$COLOR_BOLD\]"

PS1+="\[$COLOR_BOLD\]"
PS1+="\w \$ \n"   # '#' for root, else '$'
PS1+="\[$COLOR_RESET\]"

export PS1

# ---




# TOOLS
#

PATH="$HOME/go/bin:$PATH"

export DOCKER_BUILDKIT=1


awkn() {
  awk -F ' ' '{print $var}' var="$1"
}
alias bat='bat -p'
cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}


# aliases and completions for tools

alias k='kubectl'
source <(k completion bash | sed 's/kubectl/k/g')
alias kns='kubectl config set-context --current --namespace'
alias less='less -R'
alias kget='kubectl get $(kubectl api-resources --verbs=list -o name | paste -sd, -) --ignore-not-found'
alias psproc='ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu'

complete -C "$(which aws_completer)" aws
complete -C "$(which terraform)" terraform
source <(kubectl completion bash)
source <(helm completion bash)
#source <(kind completion bash)


# --------




# AWS
#

alias awsecr='aws ecr get-login-password | \
    docker login \
        --username AWS \
        --password-stdin \
            $(aws sts get-caller-identity | jq -r .Account).dkr.ecr.us-east-2.amazonaws.com'
