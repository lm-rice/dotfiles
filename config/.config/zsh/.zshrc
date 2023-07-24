# Prevent the path from accumulating if manually sourcing this file
# TODO: We can probably remove this in favor of some kind of XDG trick.
if (( zsh_eval_context[(I)file] )); then 
    unset PATH
    [ -f /etc/zprofile ] && source /etc/zprofile 
    [ -f /etc/zshrc ] && source /etc/zshrc
fi

# Terminal defaults
export EDITOR="nvim"
export VISUAL="nvim"
export HISTFILE="$XDG_DATA_HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
export MANPAGER='nvim +Man!'

# Wezterm-specific constants
export WEZTERM_CONFIG_FILE="$XDG_CONFIG_HOME/wezterm/wezterm.lua"

# Enable vim mode
bindkey -v
export KEYTIMEOUT=1

# Explicitly enable backward search (fixes tmux)
bindkey '^R' history-incremental-search-backward

# Enable zsh completion (lazy)
mkdir -p "$XDG_CACHE_HOME/zsh"
autoload -U compinit; compinit -d "$XDG_CACHE_HOME/zsh/.zcompdump"
_comp_options+=(globdots)

# cd to directories without typing cd
setopt AUTO_CD

# Easy navigation using the directory stack
# Based on https://thevaluable.dev/zsh-install-configure-mouseless/
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
alias d="dirs -v"
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# Saved directories for ease of access
alias dl="cd $HOME/Downloads;"
alias p="cd $HOME/Projects;"

# Navigate up a long directory tree - probably won't use more than 5.
alias ..="cd ..;"
alias .2="cd ../..;"
alias .3="cd ../../..;"
alias .4="cd ../../../..;"
alias .5="cd ../../../../..;"

# Set-up editors
alias vi="nvim"
alias vim="nvim"
alias sublime="open -a 'Sublime Text.app'"

# Useful command shortcuts
alias l="ls"
alias la="ls -ltra"
alias vizshrc="nvim $ZDOTDIR/.zshrc"
alias rlzshrc="source $ZDOTDIR/.zshrc"

# Git command shortcuts
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout'
alias gl='git log'
alias gr='git remote'
alias grs='git remote show'
alias glo='git log --pretty="oneline"'
alias glol='git log --graph --oneline --decorate'

# User PATH Entries #
# Not too happy with this. This is still manual.
# TODO shove these in an array w/ for loop to make this easier to type
PATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin${PATH+:$PATH}"
PATH="$HOMEBREW_PREFIX/opt/python@3.10/libexec/bin${PATH+:$PATH}"
PATH="$HOMEBREW_PREFIX/opt/openjdk@11/bin:${PATH+:$PATH}"
PATH="$HOME/.cargo/bin${PATH+:$PATH}"
PATH="$HOME/bin${PATH+:$PATH}"
export PATH

[ -f $HOME/.zshrc ] && source $HOME/.zshrc 

