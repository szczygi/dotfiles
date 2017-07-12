set -xg EDITOR nvim
set -xg BROWSER google-chrome-stable

# Basic aliases
alias e="$EDITOR"
alias o="xdg-open"
alias q="exit"

function s
    if emacsclient -n $argv > /dev/null ^&1
        i3-msg "workspace 8:space" > /dev/null ^&1
    end
end

# Git aliases
alias ga="git add"
alias gc="git commit"
alias gca="git commit -a"
alias gd="git diff"
alias gl="git pull"
alias gp="git push"
alias gs="git status"

# FZF settings
set -xg FZF_DEFAULT_COMMAND 'rg --files --hidden --smart-case --glob "!.git/*"'
set -xg FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND

# Keybindings
function fish_user_key_bindings
    bind \cd "__fzf_cd_with_hidden"
    bind \cn "n (fzf)"
    bind \cr "__fzf_reverse_isearch"
    bind \cs "s (fzf)"
    bind \ct "__fzf_find_file"
end

# Colored man pages
function man
    which man | read MAN

    set -x LESS_TERMCAP_md (printf "\e[01;31m")
    set -x LESS_TERMCAP_me (printf "\e[0m")
    set -x LESS_TERMCAP_se (printf "\e[0m")
    set -x LESS_TERMCAP_so (printf "\e[01;44;33m")
    set -x LESS_TERMCAP_ue (printf "\e[0m")
    set -x LESS_TERMCAP_us (printf "\e[01;32m")

    eval $MAN $argv
end

# Emacs ansi-term support
if test -n "$EMACS"
  set -x TERM eterm-color
end

function fish_title
  true
end

set -xg LS_COLORS (ls_colors_generator)
function ls
    ls-i --color=always -A --group-directories-first -h -w (tput cols) $argv
end

# Virtualfish initialization
eval (python -m virtualfish ^ /dev/null)
