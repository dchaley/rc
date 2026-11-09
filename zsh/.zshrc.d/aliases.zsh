#!/bin/zsh
#
# .aliases - Set whatever shell aliases you want.
#

# mask built-ins with better defaults
alias cd="pushd"
alias ls="ls -F --color"
alias vi=vim
alias grep="grep --color"
alias pgrep="pgrep -l"

# Development helpers
alias gcam="git commit --amend"
alias gcamq="git commit --amend --no-edit"
alias git-tidy='git branch -d $(git branch --merged=main | grep -v main); git fetch --prune'
git-delete-stale() {
  git fetch --prune
  git for-each-ref refs/heads --format='%(refname:short)%09%(upstream:track)%09%(worktreepath)' | while IFS=$'\t' read -r branch track worktree; do
    case "$track" in *gone*) ;; *) continue ;; esac
    case "$branch" in master|main) continue ;; esac
    if [ -n "$worktree" ]; then
      echo git worktree remove "$worktree" || { echo "skip $branch ($worktree)"; continue; }
    fi
    echo git branch -D "$branch"
  done
}

alias pod="perldoc"
alias venv='. venv/bin/activate'
alias dotvenv='. .venv/bin/activate'

# Ruby helpers
alias be="bundle exec"
alias bspec="be rspec"
alias bsrb="be srb tc"
alias bundle-rubocop="git diff --name-only main | sort | uniq | perl -ne 'chomp(); if (\$_ =~ /.rb$/ && -e \$_) {print \"\$_\n\"}' | xargs bundle exec rubocop"

# Sort me
alias duh="du -h --max-depth=1"
alias duhere="du -h --max-depth=1"

# more ways to ls
alias ll='ls -lh'
alias la='ls -lAh'
alias ldot='ls -ld .*'

# fix common typos
alias quit='exit'
alias cd..='cd ..'

# tar
alias tarls="tar -tvf"
alias untar="tar -xf"

# find
alias fd='find . -type d -name'
alias ff='find . -type f -name'

# url encode/decode
alias urldecode='python3 -c "import sys, urllib.parse as ul; \
    print(ul.unquote_plus(sys.argv[1]))"'
alias urlencode='python3 -c "import sys, urllib.parse as ul; \
    print (ul.quote_plus(sys.argv[1]))"'

# misc
alias please=sudo
alias zshrc='${EDITOR:-vim} "${ZDOTDIR:-$HOME}"/.zshrc'
alias zbench='for i in {1..10}; do /usr/bin/time zsh -lic exit; done'
alias zdot='cd ${ZDOTDIR:-~}'
