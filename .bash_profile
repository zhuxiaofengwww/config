export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

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
alias sshmu='ssh qzw056@murphy.wot.eecs.northwestern.edu'

function fp() {
    echo `pwd`/"$1"
}

if [[ "$OSTYPE" == "darwin"* ]]; then
    alias cr='~/Documents/conf/cr.sh'

    export VAGRANT_PATH="/Users/zqy/Documents/projects/purple_team/scripts/vagrant/"
    function vg() {
        if [ $1 ]; then
            pushd $VAGRANT_PATH > /dev/null;
            vagrant $@;
            popd > /dev/null;
        else
            pushd $VAGRANT_PATH > /dev/null;
        fi
    }


    # Setting PATH for Python 3.3
    # The orginal version is saved in .bash_profile.pysave
    PATH="/Library/Frameworks/Python.framework/Versions/3.3/bin:${PATH}"
    export PATH
fi
