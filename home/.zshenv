############ -*- Mode: shell-script; coding: euc-jp -*- ####
# ~ippei/.zshenv
#   written by ippei.kishida@materials.mbox.media.kyoto-u.ac.jp
# last modified : 2004-07-30
# 修正、改変、再配布何でも可
# cf: man zshall, zshoptions
############################################################
# ~/.zshenv には対話的な機能以外の部分を記述すべき
# 例えば、ssh remote ls とかでリモートホストにコマンドを投げる場合は
# ~/.zshenv のみ有効で ~/.zshrc などは有効にならない
# この場合 ~/.zshenv に PATH の設定がなければ ls は実行できない
############################################################
#### ARCHI
if [ -x /usr/bin/uname ] || [ -x /bin/uname ]; then
    case "`uname -sr`" in 
        FreeBSD*); export ARCHI="freebsd" ;;
        Linux*);   export ARCHI="linux"   ;;
        CYGWIN*);  export ARCHI="cygwin"  ;;
        IRIX*);    export ARCHI="irix"    ;;
        OSF1*);    export ARCHI="osf1"    ;;
        *);        export ARCHI="dummy"   ;;
    esac
else
    export ARCHI="dummy"
fi

#### HOST
if [ -x /bin/hostname ]; then
    export HOST=`hostname`
fi;
export host=`echo $HOST | sed -e 's/\..*//'`

export UID
export SHELL=`which zsh`
export CC="/usr/bin/gcc"
#export JLESSCHARSET="japanese"
#export MANPATH="/usr/local/man:/usr/X11R6/man:/usr/share/man"
export HTTP_HOME="$HOME/.w3m/bookmark.html" # for w3m
export FTP_PASSIVE_MODE="NO"
# export LC_CTYPE="_JP.eucJP"   # jman など
# export LANG="C"

#### $COLORTERM 
export COLORTERM=0
case "$TERM" in 
    xterm*);    COLORTERM=1 ;;
    mlterm*);   COLORTERM=1 ;;
    screen*);   COLORTERM=1 ;;
    ct100*);    COLORTERM=1 ;;  # TeraTermPro
    kterm*);    COLORTERM=1 ; TERM='kterm-color';;
    #vim は TERM='kterm' ではカラー化しない
    #screen は TERM='kterm-color' ではタイトルバーに情報表示できない
esac

#### EDITOR
#export EDITOR='vi'
#if [ -x `where vim`  ]; then    
#    export EDITOR="vim"
#    alias vi="vim"              # "skkfep -viesc -e jvim3"
#fi
 
####  path / PATH
# システムから提供される PATH およびユーザが定義する複数の候補から、
# 実際にシステムに存在するディレクトリに対してのみ PATH に追加する
# この際重複チェックを行い、同一のディレクトリが含まれないようにしている
userpath=( \                    # 配列に候補を入れる
    $path /bin /sbin /usr/bin /usr/sbin /usr/local/bin /usr/local/sbin \
    $HOME/bin $HOME/private/bin \
    /usr/X11R6/bin /usr/games \
    /usr/bsd /usr/bin/X11 /usr/bin/X11 /usr/i18n/bin /home/program/bin \
        )
addpath=()                      # 確定した候補を入れていく受け皿
for i in "${userpath[@]}"; do   # 受け皿に追加していく
    chksame=0
    if [ -d $i ]; then          # システムにディレクトリが存在しなければ飛ばす
        for j in "${path[@]}"; do
            if [ $i = $j ]; then # 重複しているなら重複フラグを立てておく
                chksame=1
                break
            fi
        done
        if [ $chksame = 0 ] ; then # 重複フラグが立ってなければ受け皿に追加
            addpath=( $addpath $i )
        fi
    fi
done
path=( $path $addpath )
unset userpath addpath i chksame # 後始末

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


