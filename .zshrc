# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt inc_appendhistory extendedglob prompt_subst hist_ignore_dups
bindkey -e
# End of lines configured by zsh-newuser-install

bindkey "^[[5D" backward-word
bindkey "^[[5C" forward-word  

bindkey "^U" backward-kill-line



# Some colors:
C_DARKGRAY="[01;30m"
C_RED="[01;31m"
C_GREEN="[01;32m"
C_YELLOW="[01;33m"
C_BLUE="[01;34m"
C_PURPLE="[01;35m"
C_CYAN="[01;36m"
C_RESET="[00m"

want_color=false

case "$TERM" in
xterm-color)
    want_color=true
esac

# if we're in a gnome-terminal, manually set the term
if [ "$COLORTERM" = "gnome-terminal" ]; then
    want_color=true
fi

# ah what the hell, we know we want color always anyhow
want_color=true

# set a fancy prompt (non-color, unless we know we "want" color)
if [ $want_color = true ] ; then
    #PS1='[%{[01;32m%}%n@%m%{[00m%}:%{[01;35m%}[%T]%{[00m%}:%{[00;34m%}$(abbreviate_paths "%~")%{[00m%}\$ '
    PROMPT='[%{$C_GREEN%}%n@%m%{$C_RESET%}:%{$C_BLUE%}$PROMPT_PWD%{$C_RESET%}]\$ '
    DEFAULT_PROMPT=$PROMPT
else
    PROMPT='[%n@%m:[%T]:$(abbreviate_paths "%~")\$ '
fi

if [ "$OSTYPE" = "darwin16.0" ] ; then
    bindkey '\e[1;5D' backward-word
    bindkey '\e[1;5C' forward-word
    bindkey '\e[H' beginning-of-line
    bindkey '\e[F' end-of-line
    bindkey '\e[3~' delete-char
fi

# right-side prompt
CMDTIME=""
DEFAULT_RPS1='${CMDTIME}%{$C_PURPLE%}[%T]%{$C_RESET%}'
RPS1=$DEFAULT_RPS1

setopt prompt_subst

alias simple-prompt='export PROMPT="\$ "; export RPS1=""'
alias normal-prompt='export PROMPT="$DEFAULT_PROMPT"; export RPS1="$DEFAULT_RPS1"'

function title {
  # escape '%' chars in $1, make nonprintables visible
  a=${(V)1//\%/\%\%}

  # Truncate command, and join lines.
  a=$(print -Pn "%40>...>$a" | tr -d "\n")

  case $TERM in
  screen)
    print -Pn "\e]2;$a @ $2\a" # plain xterm title
    print -Pn "\ek$a\e\\"      # screen title (in ^A")
    print -Pn "\e_$2   \e\\"   # screen location
    ;;
  xterm*|rxvt)
    print -Pn "\e]2;$a @ $2\a" # plain xterm title
    ;;
  esac
}

# precmd is called just before the prompt is printed
function precmd() {
  title "zsh" "%m(%55<...<%~)"
  PROMPT_PWD="${(%):-%~}"
  PROMPT_PWD="$(abbreviate_paths $PROMPT_PWD)";

  if [ $timer ]; then
    timer_show=$(($SECONDS - $timer))
    CMDTIME="%{$C_CYAN%}${timer_show}s %{$C_RESET%}"
    unset timer
  fi
}

# preexec is called just before any command line is executed
function preexec() {
  title "$1" "%m(%35<...<%~)"
  timer=${timer:-$SECONDS}
}

# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

#PROMPT="%n@%m:%~%# "

if [ -f ~/.zsh-env ]; then
    . ~/.zsh-env
fi

if [ -e ~/.zsh-local ] ; then
    source ~/.zsh-local
fi

if [ -e ~/.zsh-local-mac ] ; then
    source ~/.zsh-local-mac
fi

if [ -e ~/.zsh-aliases ] ; then
    source ~/.zsh-aliases
fi

if [ -e ~/.zsh-prompt ] ; then
    #source ~/.zsh-prompt
fi


setopt pushd_silent pushd_tohome
function go-back-dir {
    pushd +1;
    zle redisplay;
    zle accept-line
}
function go-forward-dir {
    pushd -0;
    zle redisplay; 
    zle accept-line
}
function go-parent-dir {
    cd ..;
    zle accept-line
}

# register the functions
zle -N go-back-dir
zle -N go-forward-dir
zle -N go-parent-dir

bindkey "^[-" go-back-dir
bindkey "^[=" go-forward-dir
bindkey "^[^[[A" go-parent-dir

# bind esc-f to plain-old file completion
zle -C complete-file complete-word _generic
zstyle ':completion:complete-file::::' completer _files
bindkey '^[f' complete-file

# allow completion in the middle of a word
setopt completeinword

# don't treat "/" as part of a word
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# david's stuff follows
export EDITOR=vim
export VISUAL=vim


function abbreviate_paths()
{
    local p="$1";
    
    # replace any sequence of more than 9 letters with first six plus ...
    
    # 1. read input line
    # 2. subst. sequence of 7+ characters with first 3

    local perlcode='
        $_ = <>; \ 
        #print STDERR "\"$_\""; \
        s/([^\/]{3})[^\/]{4,}\//\1..\//g;  \
        #s/([^\\\\]) /$1\\ /g;  \
        #print STDERR $_; \
        print $_;  '

    local abbrev="`echo $p | perl -e "$perlcode"`"

    echo $abbrev
}

export PATH=~/bin:$PATH

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
which direnv > /dev/null && eval "$(direnv hook zsh)"
