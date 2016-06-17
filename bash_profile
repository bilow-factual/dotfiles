PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
PATH=$PATH:$HOME/bin
PROFILE_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $PROFILE_DIRECTORY/.git-prompt.sh
export PS1='\[$(tput bold)\]\[\033[38;5;11m\]\u\[$(tput sgr0)\]@\[$(tput bold)\]\h \[\033[38;5;214m\]\W \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;153m\]$(__git_ps1 "(%s)")\[$(tput sgr0)\]\[$(tput sgr0)\]\$ '

export CLICOLOR=1
export LSCOLORS=EhFxBxDxBxegedabagacad

export PYSPARK_PYTHON='/usr/local/bin/python3'
export HISTSIZE=10000
export HISTFILESIZE=10000

alias grep='grep --color=auto'
alias emacs='emacs -nw'
alias tmux_h='tmux select-layout even-horizontal'
alias tmux_v='tmux select-layout even-vertical'

alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gcm='git commit -m '
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'

alias got='git '
alias get='git '
alias gst='git status'
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

alias tabfirstsort='sort -t "	" -k 1 -n'
alias update='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade'
alias whatismyip='curl -s checkip.dyndns.org | grep -Eo [0-9.]+'
