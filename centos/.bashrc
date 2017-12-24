# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

PS1='\[\e[1;34m\]\w\[\e[m\]\[\e[1;30m\]$(__git_ps1 " %s") \[\e[m\]\[\e[1;32m\]\$ \[\e[m\]'

alias lh='ls -lh'
alias yum='sudo yum'
alias tb='nc termbin.com 9999'
alias shutdown='sudo shutdown -h now'
alias enablepython27='scl enable python27 bash'
alias p7='/opt/rh/python27/root/usr/bin/python2.7'
alias p3='/usr/local/bin/python3.6'

function csmake () {
    CFILE=`echo $1 | cut -d'.' -f1`
    clang -fsanitize=integer -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wshadow ${CFILE}.c -lcrypt -lm -o $CFILE
}
