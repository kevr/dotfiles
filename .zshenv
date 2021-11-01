# Basic system defaults.
export EDITOR="nvim"
export BROWSER="firefox"

# By default, we use -j8 to match our local core count.
export MAKEFLAGS="-j8"

# Use mpd.local.net for mpc.
export MPD_HOST="mpd.local.net"

# Prefer IPv4 for ssh.
export GIT_SSH_COMMAND="ssh -4"

export PATH="$HOME/.local/bin:/usr/local/bin:${PATH}"

export HISTSIZE=10000
export SAVEHIST=10000

# export MOZ_ENABLE_WAYLAND=0
# export GDK_BACKEND=wayland
