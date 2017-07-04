export EDITOR="editor"
export PATH=~/.dotfiles/bin:$PATH

HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000

bindkey -e
bindkey "\e[3~" delete-char

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias e="$EDITOR"
alias gs="gst"
alias k="k -h"
alias ka="k -Ah"
alias kf="ka | fpp"
alias ls="ls --color"
alias q="exit"

function mkcd() {
    mkdir -p "$@"  && cd $_
}

# Source zplug
source ~/.dotfiles/zplug/init.zsh

# Plugins settings
ENHANCD_DOT_ARG=...

SPACESHIP_PROMPT_SYMBOL="❯"
SPACESHIP_TIME_SHOW=true

# Plugins list
zplug "b4b4r07/enhancd", use:init.sh # Requires fzy
zplug "djui/alias-tips"
zplug "chrissicool/zsh-256color"
zplug "denysdovhan/spaceship-zsh-theme", use:spaceship.zsh, from:github, as:theme
zplug "supercrabtree/k"
zplug "zdharma/fast-syntax-highlighting", defer:2
zplug "zdharma/history-search-multi-word"

zplug "plugins/archlinux", from:oh-my-zsh
zplug "plugins/git",  from:oh-my-zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"

# Load plugins
zplug load

# virtualenvwrapper
source virtualenvwrapper.sh

# nvm - Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# gvm - Go Version Manager
[[ -s "/home/piotr/.gvm/scripts/gvm" ]] && source "/home/piotr/.gvm/scripts/gvm"
