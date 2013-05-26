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
alias listen='lsof -i -P |grep LISTEN'

alias mkdir='mkdir -p'

alias sshm='ssh -p 11024 -4 root@micbase.com'
alias sshp='ssh pi@192.168.1.148'
alias sshmi='ssh -p 32957 -4 root@milee.me'
alias ssh4='ssh root@parkinson-16.wot.eecs.northwestern.edu'

alias cr='~/Documents/conf/cr.sh'
alias pht='python -m SimpleHTTPServer'
alias p8='ping 8.8.8.8'
alias pingp='ping 192.168.1.148'
alias gst='git status'
alias scs='rsync -vpr --progress --delete --stats --exclude "*/.git/" --exclude "*.pyc" ~/FBdownload/scalable_sentiment/* download@social3.ece.northwestern.edu:/home/download/sc/'
alias scsp='rsync -vpru --progress --delete --stats --exclude "*/.git/" --exclude "*.pyc" ~/FBdownload/scalable_sentiment/* download@social3.ece.northwestern.edu:/home/download/sc/'

function fp() {
    echo `pwd`/"$1"
}
