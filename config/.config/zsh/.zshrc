#!/usr/bin/env zsh

# On first load, store the original PATH so we can reset it on reload.
if [[ -z "$_ORIGINAL_PATH" ]]; then
  _ORIGINAL_PATH=$PATH
fi

# When reloading the file manually (with rlzshrc or source variant), reset PATH.
if (( zsh_eval_context[(I)file] )); then
    PATH="$_ORIGINAL_PATH"
fi

# Check if the directory is already in PATH. If not, prepend it.
add_to_path() {
  [[ ":$PATH:" != *":$1:"* ]] && PATH="$1:$PATH"
}

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
alias d="dirs -v | head -n 10"
for index ({0..9}) alias "$index"="cd +${index}"; unset index

# Directories I use or reference often.
export PROJECTS_PATH="$HOME/Projects"

# Saved directories for ease of access
alias dl="cd $HOME/Downloads;"
alias p="cd $PROJECTS_PATH;"

# Navigate up a long directory tree - probably won't use more than 5.
alias ..="cd ..;"
alias .2="cd ../..;"
alias .3="cd ../../..;"
alias .4="cd ../../../..;"
alias .5="cd ../../../../..;"

# Set-up editors
alias vi="$EDITOR"
alias vim="$EDITOR"
alias sublime="open -a 'Sublime Text.app'"

# Useful command shortcuts
alias l="ls"
alias la="ls -ltra"
alias vizshrc="$EDITOR $ZDOTDIR/.zshrc"
alias rlzshrc="source $ZDOTDIR/.zshrc"

# Wezterm-specific aliases
alias imgcat="wezterm imgcat"

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

# Rebuild PATH without accumulating duplicates.
PATH="$_ORIGINAL_PATH"

if [[ -n "$HOMEBREW_PREFIX" ]]; then
  add_to_path "$HOMEBREW_PREFIX/bin"
  add_to_path "$HOMEBREW_PREFIX/sbin"
  add_to_path "$HOMEBREW_PREFIX/opt/python@3.10/libexec/bin"
  add_to_path "$HOMEBREW_PREFIX/opt/openjdk@17/bin"
fi

add_to_path "$HOME/.cargo/bin"
add_to_path "$HOME/bin"
add_to_path "$PROJECTS_PATH/scripts"

export PATH

# Source the unmanaged .zshrc if it exists.
[ -f $HOME/.zshrc ] && source $HOME/.zshrc 

