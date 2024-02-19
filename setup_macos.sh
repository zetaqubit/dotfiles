# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install iterm2
brew install git

# Oh My Zsh
# https://www.josean.com/posts/terminal-setup
# ! .zshrc - Change to ZSH="$HOME/.zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# PowerLevel10k
# ! .zshrc - Change to ZSH_THEME="powerlevel10k/powerlevel10k"
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


# fzf
brew install ag fzf

# tmux
# ! In tmux, ctrl-space I to install plugins.
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Copy configs over.
brew install stow
cd ~/code/zetaqubit/dotfiles
stow -t ~/ sioyek tmux vim vimari vimium zsh 
cd -

# Vim
# ! In vim, :PlugInstall to install the plugins.

# Experimental
brew install terminal-notifier
