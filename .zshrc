#----------------------------
# History
#----------------------------
HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000

#-----------------------------
# ZSH
#-----------------------------
# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

plugins=(
  git,
  alias-tips,
  bash,
  bd,
  colored-man-pages
)

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

# Theme
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=0
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_last"

#-----------------------------
# Exports
#-----------------------------
export LC_COLLATE="C" # Display . prefixed files/dirs on top in `ll`

# text, that Vim is going to be there for you
export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

# Custom Maven install
export M2_HOME=/opt/maven
export M2=$M2_HOME/bin
export PATH=$M2:$PATH
export MAVEN_OPTS="-Xmx2048m"

# Custom Java install
export PATH=/usr/java/current/bin:$PATH

# FZF
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude target'

#-----------------------------
# Aliases
#-----------------------------
alias pacman="pacman --color auto"
alias ls="ls -lh --color=always --group-directories-first"
alias ll="ls -lha --color=always --group-directories-first"
alias rm="trash"
alias mvn_find_corrupted="find $HOME/.m2/repository/ -name \"*jar\" | xargs -L 1 zip -T | grep error | grep 'structure invalid'"
alias vim="nvim"
alias bq="bq --disable_ssl_validation" # BigQuery CLI fails on SSL validation

#-----------------------------
# Sources
#-----------------------------
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
   source /etc/profile.d/vte.sh
fi
source /usr/share/zsh/plugins/alias-tips/alias-tips.plugin.zsh
source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
source /usr/share/nvm/init-nvm.sh


#-------------------------------
# Proxy
#-------------------------------
function backup_pacman() {
  pacman -Qe | cut -f1 -d ' ' > $(cd `dirname $0` && pwd)/pacman.packages
}

