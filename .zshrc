# The following lines were added by compinstall
zstyle :compinstall filename '/home/jldailey/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

export PROMPT="%n@%m %~ %% "

export PATH="/home/jldailey/bin:$PATH"

export GOOS=linux
export GOARCH=386
export GOROOT=/opt/go

export PATH="$PATH:/opt/go/bin"
export PATH="$PATH:$HOME/node/bin"

