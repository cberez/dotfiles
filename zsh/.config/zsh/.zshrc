export TERM="xterm-256color"

#-----------------------------
# ZSH
#-----------------------------
# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

plugins=(
  git
#  alias-tips # sourced after aur install
  colored-man-pages
)

ZSH_CACHE_DIR=$XDG_CACHE_HOME/oh-my-zsh
[[ ! -d $ZSH_CACHE_DIR ]] && mkdir $ZSH_CACHE_DIR

# Compdump
ZSH_COMPDUMP="${ZSH_CACHE_DIR}/zcompdump-$(hostname)-${ZSH_VERSION}"

# History
HISTFILE=$XDG_DATA_HOME/histfile
HISTSIZE=1000
SAVEHIST=1000

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/alias-tips/alias-tips.plugin.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

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

#-----------------------------
# Aliases
#-----------------------------
alias pacman="pacman --color auto"
alias ls="ls -lh --color=always --group-directories-first"
alias ll="ls -lha --color=always --group-directories-first"
alias rm="trash"
alias vim="nvim"

# ~/ cleaning
alias mvn="mvn -gs $XDG_CONFIG_HOME/maven/settings.xml"
alias sbt="sbt -ivy $XDG_DATA_HOME/ivy2 -sbt-dir $XDG_DATA_HOME/sbt"

#alias mvn_find_corrupted="find $HOME/.m2/repository/ -name \"*jar\" | xargs -L 1 zip -T | grep error | grep 'structure invalid'"
#alias bq="bq --disable_ssl_validation" # BigQuery CLI fails on SSL validation

#-----------------------------
# Sources
#-----------------------------
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
   source /etc/profile.d/vte.sh
fi
#source /usr/share/zsh/plugins/alias-tips/alias-tips.plugin.zsh
source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme

# NVM
export NVM_DIR="$XDG_CONFIG_HOME/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


#-------------------------------
# Proxy
#-------------------------------
function backup_pacman() {
  pacman -Qe | cut -f1 -d ' ' > $(cd `dirname $0` && pwd)/pacman.packages
}

