# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

function parse_git_branch () {
	BRANCH=`git branch 2>/dev/null | grep -E "^\*" | cut -d' ' -f2`
	if [ $BRANCH ]; then
        echo "$BRANCH "
    fi
}

PS1='\[\e[1;34m\]\w\[\e[m\] \[\e[1;34m\]$(parse_git_branch)\[\e[m\]\[\e[1;32m\]\$ \[\e[m\]'

alias lh='ls -lh'
alias yum='sudo yum'
alias tb='nc termbin.com 9999'
alias shutdown='sudo shutdown'
