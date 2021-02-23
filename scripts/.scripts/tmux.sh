#!/bin/bash

# Refresh tmux status bar after kubectx call
function kx {
  kubectx $@; tmux refresh-client -S
}
