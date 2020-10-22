# XDG config fallback if not defined
[[ -z "$XDG_CONFIG_HOME" ]] && export XDG_CONFIG_HOME="$HOME/.config"
[[ -z "$XDG_CACHE_HOME" ]] && export XDG_CACHE_HOME="$HOME/.cache"
[[ -z "$XDG_DATA_HOME" ]] && export XDG_DATA_HOME="$HOME/.local/share"

# Default programs
export EDITOR="nvim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR
export BROWSER="chromium"
export TERMINAL="urxvt"
export STATUSBAR="i3status"

# ~/ cleaning
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export XINITRC=$XDG_CONFIG_HOME/X11/xinitrc
export LESSHISTFILE=$XDG_CACHE_HOME/less/history
export XAUTHORITY=$XDG_RUNTIME_DIR/Xauthority
export GOPATH=$XDG_DATA_HOME/go
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker


if command -v systemctl &> /dev/null && systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx "$XDG_CONFIG_HOME/X11/xinitrc"
fi
