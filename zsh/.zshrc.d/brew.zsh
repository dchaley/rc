(( $+commands[brew] )) || return 1
eval $(brew shellenv)


# Wrap these exports in a check if /opt/homebrew/opt/libpq exists
if [[ -d /opt/homebrew/opt/libpq ]]; then
  export LDFLAGS="-L/opt/homebrew/opt/libpq/lib $LDFLAGS"
  export CPPFLAGS="-I/opt/homebrew/opt/libpq/include $CPPFLAGS"
  export PKG_CONFIG_PATH="/opt/homebrew/opt/libpq/lib/pkgconfig:$PKG_CONFIG_PATH"
  export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
fi