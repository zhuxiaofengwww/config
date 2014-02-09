export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

#Powerline Settings
. ~/.vim/bundle/powerline/powerline/bindings/bash/powerline.sh

alias ll='ls -alhF'
alias df='df -h'
alias grep='grep --color=auto'
alias mkdir='mkdir -p'
alias du='du -c -h'
alias duh='du -h -d 1'

alias ..='cd ..'
alias pht='python -m SimpleHTTPServer'
alias p8='ping 8.8.8.8'
alias gst='git status'

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias ls='ls -F --color=auto'
    alias listen='netstat -tulnp'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    alias ls='ls -F -G'
    alias listen='lsof -i -P |grep LISTEN'
fi

alias cdd='cd ~/Downloads/'
alias cdb='cd ~/Dropbox/'
alias cdw='cd ~/Dropbox/Work'
alias cds='cd ~/Dropbox/Study'

alias sshm='ssh -p 11024 -4 root@micbase.com'

function fp() {
    echo `pwd`/"$1"
}

if [[ "$OSTYPE" == "darwin"* ]]; then
    alias cr='~/Documents/conf/cr.sh'
    alias cdp='cd ~/Documents/projects/'

    export VG_PATH="/Users/zqy/Documents/projects/brewer/scripts/vagrant/"
    function vg() {
        if [ $1 ]; then
            pushd $VG_PATH > /dev/null;
            vagrant $@;
            popd > /dev/null;
        else
            pushd $VG_PATH > /dev/null;
        fi
    }
fi
