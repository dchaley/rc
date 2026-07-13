(( $+commands[direnv] )) || return 1

which direnv > /dev/null && eval "$(direnv hook zsh)"
