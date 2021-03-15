# Basic system defaults.
export EDITOR="vim"
export BROWSER="firefox"

# By default, we use -j8 to match our local core count.
export MAKEFLAGS="-j8"

export PATH="$HOME/.local/bin:${PATH}"

export DISPLAY=":1"
source "$HOME/.cargo/env"
