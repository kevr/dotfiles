# .zshrc configuration for Kevin Morris <kevr@0cost.org>.
#
# License: MIT
#
autoload -Uz compinit promptinit colors
compinit
promptinit
colors

# Do not complete files for git
compdef _files git

# Set some zsh options.
setopt prompt_subst
setopt no_hup
setopt noextendedglob

# Include partial configurations.
partials=('.fzf.zsh' '.zsh.greet' '.zsh.functions' '.zsh.aliases')
for partial in $partials; do
    [[ -f $HOME/$partial ]] && source $HOME/$partial
done

# Prompt configuration.
NL=$'\n'
PROMPT="{ %F{green}%n%f@%F{green}%m%f %1~ } > "
RPROMPT="\$(brname)[%?]"

# Setup NVM.
source $HOME/.nvm/nvm.sh
nvm use 13

# Setup PyEnv.
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
source $(pyenv root)/versions/3.9.5/envs/venv/bin/activate

# Setup Cargo.
source $HOME/.cargo/env

# Add cabal.
export PATH="${HOME}/.cabal/bin:${PATH}"

# To start off with, source any .envrc that we can find.
# cd is then wrapped to also run this after changing any
# directory. If no .envrc is found, the previously used
# environment (temporarily stored at /tmp/envrc) will be
# sourced.
# source $HOME/.envrc-wrapper/envrc

# Setup GPG_TTY so pinentry-tty works.
export GPG_TTY=$(tty)

# aurweb local development.
export AUR_CONFIG=conf/config
export PYTHONPATH=/home/kevr/dev/aurweb

# aurweb git-bridge vars.
export GIT_BRIDGE_SOCKET=/home/kevr/dev/aurweb/sockets/git-bridge.sock

export PATH="$HOME/.poetry/bin:$PATH"
