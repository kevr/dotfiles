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
PROMPT="{ %F{cyan}%n%f %1~ } > "
RPROMPT="\$(brname)[%?]"

eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
source $(pyenv root)/versions/venv/bin/activate

# Setup NVM.
source $HOME/.nvm/nvm.sh
nvm use 13

# Setup Cargo.
source $HOME/.cargo/env

# if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
#    exec sway
#fi
#
export PATH="${PATH}:/usr/lib/aurutils"
export AUR_CONFIG=conf/config
export PATH="/home/kevr/aur/transifex-client-git:$PATH"
