# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
export SYSTEMD_PAGER=

# User specific aliases and functions

function parse_git_branch () {
    BRANCH=`git branch 2>/dev/null | grep -E "^\*" | cut -d' ' -f2`
    if [ $BRANCH ]; then
        echo "$BRANCH "
    fi
}

function workload () {
    for NODE in $(kubectl get nodes --sort-by='{.metadata.creationTimestamp}' --no-headers | cut -d' ' -f1); do  kubectl get node -o wide $NODE --no-headers && kubectl describe node $NODE | grep -A 175 'Non-terminated Pods' | grep -B 175 'Allocated resources' | grep -E "^\s+" | grep -vE "aws-node|ebs-csi-node|kube-proxy-|fluent-bit-|node-exporter"; done
}

function get_pods () {
    kubectl get pods --all-namespaces --sort-by='{.status.startTime}' | grep -vE "overp|aws-node|ebs-csi-node|kube-proxy-|fluent-bit-"
}

function get_kube_cluster () {
    CURRENT_CLUSTER=`grep current-context ~/.kube/config | cut -d/ -f2`
    if [ $CURRENT_CLUSTER ]; then
        echo "$CURRENT_CLUSTER"
    fi
}

function vaml() {
    vim -R -c 'set syntax=yaml' -;
}

function csmake () {
    CFILE=`echo $1 | cut -d'.' -f1`
    clang -fsanitize=integer -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wshadow ${CFILE}.c -lcrypt -lm -o $CFILE
}

PS1='\[\e[1;34m\]\w\[\e[m\] \[\e[1;30m\]$(parse_git_branch)\[\e[m\]\[\e[1;32m\]\$ \[\e[m\]'
#PS1='\[\e[m\]\[\e[1;34m\] k8s:\[\e[m\]\[\e[1;38m\]$(get_kube_cluster) \[\e[1;34m\]\w\[\e[m\] \[\e[1;30m\]$(parse_git_branch)\[\e[m\]\[\e[1;32m\]\$ \[\e[m\]'

eval "$(dircolors -b)"
alias lh='ls -lh --color=auto --group-directories-first'
alias tb='nc termbin.com 9999'
alias show_parent_branch='git show-branch | grep -v "$(git rev-parse --abbrev-ref HEAD)" | grep -Eo "\*.*\[.*\]" | grep -Eo "(\w+|_|-|\/)" | head -n 1'

#KUBEALIASES
alias nodes='kubectl get nodes -o wide --sort-by="{.metadata.creationTimestamp}"'
alias zones='for NODE in $(kubectl get nodes --no-headers | cut -d" " -f1); do echo $NODE: $(kubectl get node $NODE -o jsonpath="{.metadata.labels.topology\.ebs\.csi\.aws\.com/zone}"); done | column -t'
alias pods='kubectl get pods --all-namespaces --sort-by="{.status.startTime}" | grep -vE "overp|aws-node|ebs-csi-node|kube-proxy-|fluent-bit-"'

alias aaa='complete -C /usr/local/bin/aws_completer aws && complete -C /usr/local/bin/terraform terragrunt && source <(kubectl completion bash) && source <(helm completion bash)'
HISTSIZE=-1
HISTFILESIZE=-1


if [ -z $TMUX ]; then
    tmux
else
    mesg n
    PS1='\[\e[1;34m\]\w\[\e[m\] \[\e[1;30m\]$(parse_git_branch)\[\e[m\]\[\e[1;32m\]\$ \[\e[m\]'
fi
