# Tmux shortcuts
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

# Conda shortcuts
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
    *)  # Catchall. Forward all args to conda
      conda "$cmd" "$@"
      ;;
  esac
}

# History
alias hr="fc -IR"  # Read from history.
alias hw="fc -IA"  # Write (append) to history.

# Vim
alias v="vim"
alias vi="vim"

# Git
alias g='git'
alias gs='git status'
alias gr='git branch -avvv'  # Show commit status of all remotes.
alias gch='git checkout'
alias gco='git commit -am .'
alias gb='git branch'
alias gd='git diff'
alias gbs='git for-each-ref --sort=committerdate refs/heads/ --format="%(committerdate:short) %(refname:short)"'

alias watch_gl='watch -n1 --color git --no-pager log --color --oneline --graph -20'
alias watch_gs='watch -n1 --color git -c color.status=always status'

# Nvidia
alias watch_smi='watch -n1 --color nvidia-smi'

# Notebook
alias nb="jupyter notebook \
  --NotebookApp.allow_origin='https://colab.research.google.com' \
  --port=8888 \
  --NotebookApp.port_retries=0"

# SSH
alias sshz="ssh z@192.168.0.200 -p 31500 -L 8888:localhost:8888 -L 5000:localhost:5000 -L 8080:localhost:8080 -L 6006:localhost:6006 -L 7860:localhost:7860"
alias sshzr="ssh z@zetaqubit.freeddns.org -p 31500 -L 8888:localhost:8888 -L 5000:localhost:5000 -L 8080:localhost:8080 -L 6006:localhost:6006 -L 7860:localhost:7860"

# Sioyek (pdf reader)
alias pdf="/Applications/sioyek.app/Contents/MacOS/sioyek"

# CTLR-U delete from current pos to beginning of line.
bindkey \^U backward-kill-line

