#!/bin/zsh

if [[ "$TERMINAL_EMULATOR" == "JetBrains-JediTerm" ]]; then
  # This triggers a node-version load from the nvm plugin
  node --version > /dev/null
fi