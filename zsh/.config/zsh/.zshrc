export TERM="xterm-256color"
export GPG_TTY=$(tty) # for GPG compat
eval "$(/opt/homebrew/bin/brew shellenv)"

#-----------------------------
# ZSH
#-----------------------------
# Path to your oh-my-zsh installation.
if [ "$OSTYPE" = linux-gnu ]; then
    ZSH=/usr/share/oh-my-zsh/
else
    ZSH=~/dev/.oh-my-zsh
    PATH=/usr/local/sbin:$PATH
fi

plugins=(
  git
  dotenv
#  alias-tips # sourced after aur install
  colored-man-pages
  kubectl
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
if [ "$OSTYPE" = linux-gnu ]; then
    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
    source /usr/share/zsh/plugins/alias-tips/alias-tips.plugin.zsh
    source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
  else
    source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme
fi

# Theme
# ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=0
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_last"

#-----------------------------
# Exports
#-----------------------------

#-----------------------------
# Aliases
#-----------------------------
alias pacman="pacman --color auto"
if [ "$OSTYPE" != linux-gnu ]; then  # Is this not linux i.e. MacOS?
    alias ls=gls
else
    alias pacman="pacman --color auto"
    alias rm="trash"
fi

alias ll="ls -lha --color=always --group-directories-first"
alias vim="nvim"
alias v="vim"
alias vimrc="vim $XDG_CONFIG_HOME/nvim/init.vim"
alias zshrc="vim $ZDOTDIR/.zshrc"
alias dotfiles="cd ~/dotfiles"

alias tmux="tmux -f ~/.config/tmux/.tmux.conf"
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'

alias dcud="docker compose up -d"
alias dcd="docker compose down"
alias dcs="docker compose stop"
alias dcl="docker compose logs"
alias dclf="docker compose logs --follow"
alias dce="docker compose exec"
alias dcps="docker compose ps"

if [ "$OSTYPE" != linux-gnu ]; then  # Is this the macOS system?
    export PATH=$HOME/.local/gcloud/google-cloud-sdk/bin:$PATH
    export PATH=$GOPATH/bin:$PATH
    source $HOME/.local/gcloud/google-cloud-sdk/path.zsh.inc
fi

#-----------------------------
# Sources
#-----------------------------
# Scripts
SCRIPTS_DIR="$HOME/.scripts"
if [[ -d "$SCRIPTS_DIR" ]]; then
  SCRIPTS_PATH="$SCRIPTS_DIR"
  [[ -L $SCRIPTS_PATH ]] && SCRIPTS_PATH="$HOME/$(readlink "$SCRIPTS_PATH")"
  for script in $(find "$SCRIPTS_PATH" -type f); do
    [[ -f "$script" && "$script" != *".DS_Store"* ]] && {
      source "$script"
    }
  done
fi

#-------------------------------
# Proxy
#-------------------------------
function backup_pacman() {
  pacman -Qe | cut -f1 -d ' ' > $(cd `dirname $0` && pwd)/pacman.packages
}


#-------------------------------
# FZF
#-------------------------------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source $(brew --prefix)/opt/fzf/shell/key-bindings.zsh

#-------------------------------
# local RC
#-------------------------------
export LOCAL_RC=$ZSH_DIR/.localrc
[[ -f ${LOCAL_RC} ]] && source ${LOCAL_RC}


#-------------------------------
# asdf execs
#-------------------------------
. ~/.local/share/asdf/plugins/golang/set-env.zsh

export PATH="${XDG_DATA_HOME}/asdf/shims:${PATH}"

export PATH="${XDG_DATA_HOME}/gem/bin:${PATH}"

export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
