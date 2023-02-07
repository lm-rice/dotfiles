### Prevent the path from accumulating if we source this file, without manually setting our PATH here.
if (( zsh_eval_context[(I)file] )); then 
    unset PATH
    [ -f /etc/zprofile ] && source /etc/zprofile 
    [ -f /etc/zshrc ] && source /etc/zshrc
fi

### Global Definitions ###
export EDITOR="nvim"
export VISUAL="nvim"
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000

### Aliases ###
## Navigation
alias pushd="pushd -q"
alias popd="popd -q"
alias dl="pushd; cd $HOME/Downloads;"
alias projects="pushd; cd $HOME/Projects;"
alias ..="cd ..;"
alias .2="cd ../..;"
alias .3="cd ../../..;"
alias .4="cd ../../../..;"
alias .5="cd ../../../../..;"
## Editors
alias vi="nvim"
alias vim="nvim"
alias sublime="open -a 'Sublime Text.app'"
## Command shortcuts
alias l="ls"
alias la="ls -ltra"
alias vizshrc="nvim $ZDOTDIR/.zshrc"
alias rlzshrc="source $ZDOTDIR/.zshrc"
## Git shortcuts
alias gs='git status'
alias gs='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout'
alias gl='git log'
alias gr='git remote'
alias grs='git remote show'
alias glo='git log --pretty="oneline"'
alias glol='git log --graph --oneline --decorate'

### User PATH Entries ###
PATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin${PATH+:$PATH}"
PATH="$HOMEBREW_PREFIX/opt/python@3.10/libexec/bin${PATH+:$PATH}"
PATH="$HOME/bin${PATH+:$PATH}"
export PATH

