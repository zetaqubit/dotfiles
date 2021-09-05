# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Determine if Linux or Mac
if [ "$(uname)" == "Linux" ]; then
  export LINUX=true
elif [ "$(uname)" == "Darwin" ]; then
  export MAC=true
fi

_open() {
  xdg-open "$@" &> /dev/null &
}
if [ -n "$LINUX" ]; then
  alias open='_open'
fi

# Use vim for everything
export VISUAL=vim
export EDITOR="$VISUAL"
alias v="vim"
alias vi="vim"

# disable XON/OFF
stty -ixon

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# record timestamps in history
HISTTIMEFORMAT='%F %T '

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

PS1='${debian_chroot:+($debian_chroot)}'
if [ "$color_prompt" = yes ]; then
    PS1+='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '
else
    PS1+='\u@\h:\w\\n$ '
fi
unset color_prompt force_color_prompt

DULL=0
BRIGHT=1

FG_BLACK=30
FG_RED=31
FG_GREEN=32
FG_YELLOW=33
FG_BLUE=34
FG_VIOLET=35
FG_CYAN=36
FG_WHITE=37

FG_NULL=00

BG_BLACK=40
BG_RED=41
BG_GREEN=42
BG_YELLOW=43
BG_BLUE=44
BG_VIOLET=45
BG_CYAN=46
BG_WHITE=47

BG_NULL=00

##
# ANSI Escape Commands
##
ESC="\033"
NORMAL="\[$ESC[m\]"
NORMAL_BOLD="\[$ESC[1;m\]"
RESET="\[$ESC[${DULL};${FG_WHITE};${BG_NULL}m\]"

##
# Shortcuts for Colored Text ( Bright and FG Only )
##

# DULL TEXT
BLACK="\[$ESC[${DULL};${FG_BLACK}m\]"
RED="\[$ESC[${DULL};${FG_RED}m\]"
GREEN="\[$ESC[${DULL};${FG_GREEN}m\]"
YELLOW="\[$ESC[${DULL};${FG_YELLOW}m\]"
BLUE="\[$ESC[${DULL};${FG_BLUE}m\]"
VIOLET="\[$ESC[${DULL};${FG_VIOLET}m\]"
CYAN="\[$ESC[${DULL};${FG_CYAN}m\]"
WHITE="\[$ESC[${DULL};${FG_WHITE}m\]"

# BRIGHT TEXT
BRIGHT_BLACK="\[$ESC[${BRIGHT};${FG_BLACK}m\]"
BRIGHT_RED="\[$ESC[${BRIGHT};${FG_RED}m\]"
BRIGHT_GREEN="\[$ESC[${BRIGHT};${FG_GREEN}m\]"
BRIGHT_YELLOW="\[$ESC[${BRIGHT};${FG_YELLOW}m\]"
BRIGHT_BLUE="\[$ESC[${BRIGHT};${FG_BLUE}m\]"
BRIGHT_VIOLET="\[$ESC[${BRIGHT};${FG_VIOLET}m\]"
BRIGHT_CYAN="\[$ESC[${BRIGHT};${FG_CYAN}m\]"
BRIGHT_WHITE="\[$ESC[${BRIGHT};${FG_WHITE}m\]"

function len_limited_pwd() {
    local PRE= NAME="$1" LENGTH="$2";
    [[ "$NAME" != "${NAME#$HOME/}" || -z "${NAME#$HOME}" ]] &&
        PRE+='~' NAME="${NAME#$HOME}" LENGTH=$[LENGTH-1];
    ((${#NAME}>$LENGTH)) && NAME="/...${NAME:$[${#NAME}-LENGTH+4]}";
    echo "$PRE$NAME"
}

function parse_git_branch() {
    local b="$(git symbolic-ref HEAD 2>/dev/null)";
    if [ -n "$b" ]; then
        printf "(%s)" "${b##refs/heads/}";
    fi
}

USE_SIMPLE_PROMPT=true

function update_ps1() {
  if [ "$USE_SIMPLE_PROMPT" = true ]; then
    PS1=""
    PS1+="$BRIGHT_GREEN$(parse_git_branch) "
    if [ ! -z "$CONDA_DEFAULT_ENV" ]; then
      PS1+="$BRIGHT_RED($CONDA_DEFAULT_ENV) "
    fi
    PS1+="$BRIGHT_CYAN\h "
    PS1+="$BRIGHT_BLUE\w\n"
    PS1+="$BRIGHT_YELLOW\A ${BRIGHT_VIOLET}λ${WHITE} ${NORMAL}"
  else
    PS1="${RED}zomega $YELLOW\D{%m/%d} \A "
    PS1+="$GREEN$(parse_git_branch) "
    PS1+="$BRIGHT_CYAN\h "
    PS1+="$BLUE\w\n${BRIGHT_VIOLET}λ${WHITE} ${NORMAL}"

    # Add date + time before starting command.
    PS0="${BRIGHT_RED}zalpha ${BRIGHT_YELLOW}\D{%m/%d} \A "
    PS0+="${BRIGHT_GREEN}$(parse_git_branch) "
    PS0+="${BRIGHT_BLUE}\w\n${BRIGHT_VIOLET}λ${WHITE} ${NORMAL}"
    #PS0="\033[1;31mzalpha \033[1;33m\D{%m/%d} \A \033[1;32m$(parse_git_branch) \033[1;34m\w$ESC[m\n"
  fi
}

# Display the git branch in the prompt
PROMPT_COMMAND="update_ps1"
update_ps1


# Save and reload the history after each command finishes
#PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Save the history after each command finishes
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"


# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\033]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

if [ "$MAC" == true ]; then
  export CLICOLOR=1
  export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
  export GREP_OPTIONS='--color=auto'
  export GREP_COLOR='1;35;40'
fi

# some more ls aliases
alias ll="ls -lF"
alias la="ls -A"
alias l="ls -CF"

# git shortcuts
alias gs='git status'
alias gr='git branch -avvv'  # Show commit status of all remotes.
alias gch='git checkout'
alias gco='git commit -am .'
alias gb='git branch'
alias gd='git diff'
alias gbs='git for-each-ref --sort=committerdate refs/heads/ --format="%(committerdate:short) %(refname:short)"'

alias gwl='watch -n1 --color git --no-pager log --color --oneline --graph -20'
alias gws='watch -n1 --color git -c color.status=always status'

# tmux shortcuts
t() {
  cmd="$1"
  shift
  case "$cmd" in
    a)
      tmux attach -t "$@" 2>/dev/null || tmux new -s "${1}"
      ;;
    d)
      tmux kill-session -t "$@"
      ;;
    k)
      tmux kill-session -t "$@"
      ;;
    n)
      tmux new -s "${1}"
      ;;
    c)  # Attach to clone of existing session.
      tmux attach -t "${1}_$2" 2>/dev/null || tmux new -s "${1}_$2" -t "$1"
      ;;
    *)  # Catchall. Forward all args to tmux
      tmux "$cmd" "$@"
      ;;
  esac
}

# conda shortcuts
c() {
  cmd="$1"
  shift
  case "$cmd" in
    a)
      conda activate "$@"
      ;;
    d)
      conda deactivate
      ;;
  esac
}

alias nb="jupyter notebook \
  --NotebookApp.allow_origin='https://colab.research.google.com' \
  --port=8888 \
  --NotebookApp.port_retries=0"

# logcat grep
alias loggrep='adb logcat | grep'

# grep excluding scons-out
alias mgrep='grep --exclude-dir=scons-out'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

export PATH="$HOME/neovim/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.local/bin"

# Force Clang as the default C and C++ compiler in CMake
#export CC=/usr/bin/clang
#export CXX=/usr/bin/clang++

alias python_test="python -m unittest discover -p '*_test.py'"

if [ -f /usr/share/fzf/key-bindings.bash ]; then
  source /usr/share/fzf/key-bindings.bash
fi

if [ -f /usr/share/fzf/completion.bash ]; then
  source /usr/share/fzf/completion.bash
fi

if [ -f ~/.bashrc_local ]; then
  source ~/.bashrc_local
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
