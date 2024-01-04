# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && . "$HOME/.fig/shell/zshrc.pre.zsh"

source $HOME/.zsh/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<EOS
    # Bundles from the default repo (robbyrussell's oh-my-zsh)
    git
    # Syntax highlighting bundle.
    zsh-users/zsh-syntax-highlighting
    # Fish-like auto suggestions
    zsh-users/zsh-autosuggestions
    # Extra zsh completions
    zsh-users/zsh-completions
    # z
    rupa/z z.sh
EOS

antigen theme robbyrussell
antigen apply

eval "$(starship init zsh)"

export PATH="/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/usr/X11/bin:/usr/X11R6/bin"

export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export GIT_STATUS_IGNORE_SUBMODULES=false

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

source ~/.config/zsh/.zshrc_all

export PATH="$HOME/.poetry/bin:$PATH"

# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && . "$HOME/.fig/shell/zshrc.pre.zsh"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"

