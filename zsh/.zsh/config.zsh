# History
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt APPEND_HISTORY            # Append history when the shell exits.
setopt NO_INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt NO_SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

# Paths
export PATH="$HOME/neovim/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/opt/homebrew/bin"
export PATH="/opt/homebrew/opt/qt5/bin:$PATH"

# Python
alias python_test="python -m unittest discover -p '*_test.py'"
export PYTHONPATH="$PYTHONPATH:$HOME/code/zetaqubit/ml"
export PYTHONPATH="$PYTHONPATH:$HOME/code/zetaqubit/stock"
export PYTHONPATH="$PYTHONPATH:$HOME/code/zetaqubit/camel-up"
export PYTHONPATH="$PYTHONPATH:$HOME/code/zetaqubit/redditlm"

# FZF
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
