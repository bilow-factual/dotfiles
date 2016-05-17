PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
PATH=$PATH:$HOME/bin
PROFILE_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $PROFILE_DIRECTORY/git-prompt.sh
export PS1='\u@\h \W$(__git_ps1 "(%s)") \$ '
export PYSPARK_PYTHON='/usr/local/bin/python3'
export HISTSIZE=10000
export HISTFILESIZE=10000

alias grep='grep --color=auto'
alias emacs='emacs -nw'
alias tmux_h='tmux select-layout even-horizontal'
alias tmux_v='tmux select-layout even-vertical'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

alias tabfirstsort='sort -t "	" -k 1 -n'
alias update='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade'
alias whatismyip='curl -s checkip.dyndns.org | grep -Eo [0-9.]+'
