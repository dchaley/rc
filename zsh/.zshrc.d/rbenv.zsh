(( $+commands[rbenv] )) || return 1

eval "$(rbenv init - --no-rehash zsh)"
