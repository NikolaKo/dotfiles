# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/nikolako/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e
# End of lines configured by zsh-newuser-install

#Stuff
autoload -U colors && colors
#Aliases
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ll='ls -l --color=auto'
alias lla='ls -al --color=auto'
alias pls='sudo $(fc -ln -1)'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

#PROMPT
PROMPT="%{$fg[cyan]%}%n%{$reset_color%}@%m%{$fg[red]%} > %{$reset_color%}"
RPROMPT="%{$fg[magenta]%}%3d%{$reset_color%}" 

#Env variables
export EDITOR=vim
