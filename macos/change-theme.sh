#!/bin/zsh

is-macos() { [[ "$OSTYPE" == darwin* ]] }

source ${ZDOTDIR:-$HOME}/.antidote/antidote.zsh
antidote load

root=`antidote path alberti42/zsh-appearance-control`

# If $1 is "dark", dispatch 1. If $1 is "light" or otherwise, dispatch 0.
if [[ "$1" == "dark" ]] ; then
  $root/bin/appearance-dispatch cache 1
else
  $root/bin/appearance-dispatch cache 0
fi
