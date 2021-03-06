#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History
HISTCONTROL=ignoreboth
shopt -s histappend
#HISTSIZE=1000
#HISTFILESIZE=2000

shopt -s autocd
shopt -s checkwinsize

source ~/.bash_git

export GIT_PS1_SHOWDIRTYSTATE=1

export PS1="\[\e[00;37m\]\n\u@\h \w\[\033[32m\]\$(__git_ps1)\n\[\e[0m\]\[\e[00;31m\]λ \[\e[0m\]"


if [ "$PS1" ];
then
  complete -cf sudo
fi

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

set -o emacs

# ls aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
# alias l='ls -CF'
alias l1='ls -1'

export EDITOR="emacs"
export ALTERNATE_EDITOR=""
alias e='emacsclient -c'


# pacman
alias pacman='sudo pacman'
alias pacdep='sudo pacman -Si'
alias packer='apacman'
# git
alias gpr='git pull --rebase'
alias stashsave='git stash save'
alias stashpop='git stash pop'
alias sgpr='stashsave && gpr origin master && stashpop'
# cabal
alias cabaldeps='cabal sandbox init; cabal install --only-dep -j'
# other
alias tree='tree -I ".git"'
alias untar='tar -zxvf'
alias myxrandr='xrandr --output VGA-1 --auto --left-of HDMI-1'
alias beetimport='beet import -i /media/cody/ASPEN/music/untagged'
alias aspen='mount /dev/sdc1'


# Path
PATH=$PATH:$HOME/.bin
PATH=$HOME/.scripts/:$PATH
PATH=$HOME/.qi/bin/:$PATH
PATH=$HOME/.local/bin/:$PATH
#PATH=$PATH:/home/cody/.gem/ruby/2.2.0/bin
#PATH=$PATH:$HOME/.node/bin
#PATH=$HOME/.cabal/bin:$PATH
#PATH=$HOME/.stack/programs/x86_64-linux/ghc-7.10.2/bin:$PATH
#PATH=$PATH:$HOME/.rvm/bin

# Shlyfile setup
SHELLY_HOME=/home/cody/.shelly; [ -s "$SHELLY_HOME/lib/shelly/init.sh" ] && . "$SHELLY_HOME/lib/shelly/init.sh"


set -o emacs

export LC_ALL="en_US.UTF-8"
