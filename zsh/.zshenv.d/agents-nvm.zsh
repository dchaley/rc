# Lazy-loading NVM is a great shell optimization, managed by the nvm OhMyZsh plugin.
# However, that only happens during interactive shell initialization (.zshrc)
#
# Some agents (eg, Claude Code Desktop) use non-interactive shells. We need to ensure
# those agents always have access to nvm. This loses the lazy loading (every agent
# command will load nvm regardless of need) but it lets agents use nvm seamlessly.

if [[ -n "$IS_CLAUDE$CLAUDECODE$CLAUDE_CODE$CURSOR_CLI$CURSOR_AGENT$GEMINI_CLI$JUNIE_PROJECT$JUNIE_TASK" ]]; then
  # Dynamically locate NVM_DIR without hardcoding paths
  if [ -z "$NVM_DIR" ]; then
    if [ -d "$HOME/.nvm" ]; then
      export NVM_DIR="$HOME/.nvm"
    elif [ -d "$HOME/.config/nvm" ]; then
      export NVM_DIR="$HOME/.config/nvm"
    elif command -v brew &>/dev/null && [ -d "$(brew --prefix nvm 2>/dev/null)" ]; then
      export NVM_DIR="$(brew --prefix nvm)"
    fi
  fi

  # Eagerly load NVM scripts so node/npm binaries are in PATH immediately
  if [ -n "$NVM_DIR" ] && [ -f "$NVM_DIR/nvm.sh" ]; then
    source "$NVM_DIR/nvm.sh"
  fi
fi
