export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export PATH="/usr/local/mysql/bin:$PATH"

alias cdd='cd ~/Downloads/'
alias cdb='cd ~/Dropbox/'
alias cdw='cd ~/Dropbox/Work'
alias cds='cd ~/Dropbox/Study'
alias ..='cd ..'

alias grep='grep --color=auto'

alias ls='ls -F -G'
alias ll='ls -alhF'

alias df='df -h'
alias du='du -c -h'
alias duh='du -h -d 1'

alias mkdir='mkdir -p'

alias sshm='ssh -p 11024 -4 root@micbase.com'
alias sshmi='ssh -p 32957 -4 root@milee.me'

alias pht='python -m SimpleHTTPServer'
alias p8='ping 8.8.8.8'
alias gst='git status'

function fp() {
    echo `pwd`/"$1"
}
