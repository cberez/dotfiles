#!/bin/sh

function gclean_branches {
  return $(git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -d)
}
