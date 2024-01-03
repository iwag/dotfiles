
export UID
export SHELL=`which zsh`
export CC="/usr/bin/gcc"
export HTTP_HOME="$HOME/.w3m/bookmark.html" # for w3m
export FTP_PASSIVE_MODE="NO"
# export LC_CTYPE="_JP.eucJP"   # jman など
# export LANG="C"

#### 個人用設定を読み込む
if [ -e ~/.zshenv_private ]; then
    source ~/.zshenv_private
fi

# for nodebrew
PATH=$HOME/.nodebrew/current/bin:$PATH

export PATH="${PATH}:${GOROOT}/bin:${GOPATH}/bin"
#export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$HOME/Devel/flutter/bin:$PATH

# export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

export PATH="/usr/local/opt/python@3.9/bin:$PATH"
export PATH=$PATH:$HOME/.poetry/bin

if [ -e ~/home/linuxbrew ]; then
   eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
   export PATH="/home/linuxbrew/.linuxbrew/opt/ruby@2.5/bin:$PATH"
fi

. "$HOME/.cargo/env"
export PATH="$HOME/.cargo/bin/:$PATH"
export PATH="$PATH:$HOME/.local/bin/"
export PATH="$PATH:$HOME/.fig/bin/"


