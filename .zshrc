# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jldailey"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# catch this common mistake
alias cd..="cd .."

export PATH=$HOME/bin:$HOME/sbin
export PATH=$PATH:/usr/local/bin:/usr/local/sbin
export PATH=$PATH:/usr/bin:/usr/sbin
export PATH=$PATH:/bin:/sbin
export PATH=$PATH:/usr/X11/bin
export PATH=$PATH:/usr/local/git/bin:/opt/go/bin
export PATH=$PATH:/usr/local/share/npm/bin

# set up the right editor
export EDITOR=vim
export VIMGUI=vim
if [ -x "`which mvim 2> /dev/null`" ]; then
	export VIMGUI="mvim --remote-tab-silent"
elif [ -x "`which gvim 2> /dev/null`" ]; then
	export VIMGUI="gvim -g --remote-tab-silent"
fi
# always bind it to 'vi'
alias gvim="echo Loading in tab... && $VIMGUI"

if [ -e /Applications ]; then
	# put XCode on the PATH
	export PATH=$PATH:/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin:/Applications/Xcode.app/Contents/Developer/usr/bin
elif [ -e /cygdrive ]; then
	# put the Windows paths on PATH
	export PATH=$PATH:/cygdrive/c/Windows:/cygdrive/c/Windows/system32
fi

setopt nocorrect
setopt nocorrectall

# Node settings:
export NODE_PATH=$HOME/lib/node_modules

alias csc="coffee -r bling -bce"
alias cs="coffee -r bling -e"
alias fs="foreman start"

# Go settings:
export GOOS=linux
export GOARCH=386
export GOROOT=/opt/go


# X11 settings:
if [ -z "$DISPLAY" ]; then
	export DISPLAY=:0
fi

export TERM=xterm-256color
