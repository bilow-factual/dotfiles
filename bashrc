# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# added by Anaconda3 4.4.0 installer
export PATH="/home/user/anaconda3/bin:$PATH"

PATH="/usr/local/bin:/usr/local/sbin:$HOME/bin:/usr/local/spark-1.6.1-bin-hadoop2.6/bin:~/code/nfu:$PATH"
export PATH=/home/bilow/anaconda3/bin:$PATH
PROFILE_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $PROFILE_DIRECTORY/.git-prompt.sh
export PS1='\[$(tput bold)\]\[\033[38;5;11m\]\u\[$(tput sgr0)\]@\[$(tput bold)\]\h \[\033[38;5;214m\]\W \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;153m\]$(__git_ps1 "(%s)")\[$(tput sgr0)\]\[$(tput sgr0)\]\$ '

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export CLICOLOR=1
export LSCOLORS=EhFxBxDxBxegedabagacad
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PYSPARK_PYTHON='/home/bilow/anaconda3/bin/python'
export HISTSIZE=10000
export HISTFILESIZE=10000

alias grep='grep --color=auto'
alias tma='tmux attach-session -t '
alias tml='tmux list-sessions'
alias tmk='tmux kill-session -t '

alias haddop='hadoop'
alias adoop='hadoop'
alias yak='yarn application -kill'
alias rmr='rm -r'
alias hdmp='hadoop fs -mkdir -p'
alias hdmv='hadoop fs -mv'
alias hdrm='hadoop fs -rm -r'
alias hddu='hadoop fs -du -h'
alias hdls='hadoop fs -ls -h'
alias hdpt='hadoop fs -put -f'
alias bpu='source ~/.bash_profile'

alias nbserve='jupyter notebook --no-browser --port=8888'

alias tabfirstsort='sort -t "	" -k 1 -n'
alias update='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade'
alias whatismyip='curl -s checkip.dyndns.org | grep -Eo [0-9.]+'
alias ls="ls --color=always"
export MAVEN_OPTS="-Xmx512m"

export HADOOP_CONF_DIR=/etc/hadoop/conf
export NFU_HADOOP_STREAMING=/usr/lib/hadoop-mapreduce/hadoop-streaming.jar
export NFU_HADOOP_OPTIONS="-D mapred.job.map.memory.mb=8192"
export NFU_NO_PAGER=1
export NI_HADOOP_JOBCONF="mapreduce.job.reduces=1024 mapreduce.reduce.memory.mb=8192"
export NI_HDFS_TMPDIR=/user/bilow/tmp
export NI_MONITOR=no
export PP="part-*"
export P0="part-0000*"
export UB=/user/bilow
export UBT=/user/bilow/tmp
export UBI=/user/bilow/insights
export UBID=/user/bilow/insights/data
export UBIP=/user/bilow/insights/places
export UBIS=/user/bilow/insights/segments
export UBD=/user/bilow/dqm
export UBDR=/user/bilow/dqm/raw_data
export UBG=/user/bilow/geocoding
export UBGG=/user/bilow/geocoding/geohashes
export UBGGB=/user/bilow/geocoding/geohashes/blacklist
export UBGGB10=/user/bilow/geocoding/geohashes/blacklist/gh10_blacklist.gz
export UBGGC5=/user/bilow/geocoding/geohashes/world_city_gh5s.gz
export UBGGR4=/user/bilow/geocoding/geohashes/region_gh4s.gz
export UBGGD4=/user/bilow/geocoding/geohashes/dma_gh4s.gz
export AA=/apps/audience
export AAP=/apps/audience/production
export AAPS=/apps/audience/production/record-split
export AAPSD=/apps/audience/production/record-split/dappack
export AAPSM=/apps/audience/production/record-split/mopubpack
export AAPST=/apps/audience/production/record-split/twcpack
export AE=/apps/extract
export AED=/apps/extract/dqm
export TNP="/tmp/ni-pe-bilow."
export IL=~/insights/lab_notebooks
export ILA=~/insights/lab_notebooks/audience_processing
export ILG=~/insights/lab_notebooks/geocoding
export ILP=~/insights/lab_notebooks/places_processing
export ILS=~/insights/lab_notebooks/stats

alias serverplease="python -m SimpleHTTPServer 8000 >&/dev/null"		
alias harime="ssh -p 42019 bilow-devbox.marathon.la.mesos.factual.com"		
alias aikuro="ssh mbilow@hoffman2.idre.ucla.edu"		
alias inumuta="ssh user@10.0.201.124"		
alias gitlab_connect="zerovpn 10.9.0.104 -p 2223 -i ~/.ssh/dev-vpn-key vpn@ec2-54-200-28-156.us-west-2.compute.amazonaws.com"		
nbconnect () {		
  ssh -N -f -L localhost:1738:localhost:8888 bilow@dev		
  open http://localhost:1738		
}		
nbreconnect () {		
  ps aux | \		
    ni FS fBK. p'r a, join " ", FR 1' rp'b =~ /^ssh -N .*localhost:1738/' \		
    p'$a = a;`kill -9 $a`' | \		
    cat && nbconnect		
}
