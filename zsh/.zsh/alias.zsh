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
alias v="nvim"
alias vi="nvim"

# Git
alias g='git'
alias gs='git status'
alias gr='git branch -avvv'  # Show commit status of all remotes.
alias gch='git checkout'
alias gco='git commit -am .'
alias gb='git branch'
alias gd='git diff'
alias gbs='git for-each-ref --sort=committerdate refs/heads/ --format="%(committerdate:short) %(refname:short)"'

alias watch_gl='watch -n2 --color -t git --no-pager lg'
alias watch_gs='watch -n2 --color -t git -c color.status=always status'

# Watch
wt() {
  watch -n5 "${@} | tail";
}

# Watch into editable vim window
we() {
  if [[ -z $1 ]]; then
    echo "Usage: run_and_edit <command>"
    return 1
  fi

  local cmd_name="${@//[^a-zA-Z0-9]/_}"
  local temp_file="$(mktemp "/tmp/${cmd_name}_XXXXXX")"
  local temp_file_working="$(mktemp "/tmp/${cmd_name}_working_XXXXXX")"

  while true; do
    $@ > "$temp_file_working" 2>&1
    # Copy the working temp file's contents to the main temp file
    # once the command completes its execution.
    cp "$temp_file_working" "$temp_file"
    sleep 5
  done &
  local loop_pid=$!  # Capture the PID of the loop process

  $@ > "$temp_file" 2>&1
  vim "$temp_file"  # Open the main temp file in Vim

  # After Vim exits, kill the background loop process specifically
  kill $loop_pid

  # Clean up the temp files
  [[ -f $temp_file ]] && rm "$temp_file"
  [[ -f $temp_file_working ]] && rm "$temp_file_working"
}

# Nvidia
alias watch_smi='watch -n1 --color -t nvidia-smi'

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

