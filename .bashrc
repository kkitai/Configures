# environment valiable setting
export PATH=/usr/local/sbin:/usr/local/Cellar/ctags/5.8/bin:$HOME/bin:/opt/local/bin/:/Users/keikitai/Tools/adt-bundle-mac-x86_64-20130729/sdk/tools:/Users/keikitai/Tools/adt-bundle-mac-x86_64-20130729/sdk/platform-tools:~/.composer/vendor/bin/:./node_modules/.bin/:/usr/local/go/bin:$PATH
export ROOT=/home/y
export CVSEDITOR=vim
export LANG="ja_JP.UTF-8"
export PAGER=less
export VIMRUNTIME=/usr/share/vim/vim73/
export GITHUB="git@github.com"
export SVN_EDITOR='vim'
export HOSTFILE=$HOME/.hosts

# console setting
export PS1="\[\e]0;\H:\w\007\]\[\033[1;32m\][\w]   \t\[\033[0m\]\n\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;33m\]\h\[\033[1;31m\]$ \[\033[1;37m\]"

# function
function trash {
    if [ ! -d $HOME/backup/dust_box/ ]; then
        mkdir -p $HOME/backup/dust_box/
    fi
   
    DUST_BOX=$HOME/backup/dust_box/

    mv -i $1 ${DUST_BOX}

    #ls -l ${DUST_BOX} | awk '{print $9}' > /tmp/$USER 
    #find ${DUST_BOX} -atime -7 >> /tmp/$USER

    #sort /tmp/$USER | uniq -c | awk '{if ($1 == "1") print $2}' | xargs rm 
}


# alias setting
alias vi='vim'
alias ll='ls -ltrh'
#alias rm='trash'
