autoload -Uz compinit promptinit colors
compinit
promptinit
colors

# Do not complete files for git
compdef _files git

setopt prompt_subst
setopt no_hup
setopt noextendedglob

# Standard aliases.
alias ls="ls --color=auto"

# Many of my projects have these scripts, so create nice
# aliases for them.

function version() {
    curdir="$(pwd)"
    while [[ ! -f $curdir/scripts/get_version.sh ]]; do
        if [ "$curdir" = "/" ]; then
            echo "No scripts/get_version.sh found."
            return 1
        fi
        curdir=$(readlink -f "$curdir/..")
    done

    sh $curdir/scripts/get_version.sh
}

alias tag="sh scripts/tag.sh"
alias run_tests="sh scripts/run_tests.sh"

# Shortcuts.
alias ver="version"

# A simple function that produces a git string for any
# repository the prompt is currently in.
#
# Example: git:repoName/master
#
function brname() {
    repo=$(git remote -v 2>/dev/null \
        | egrep 'origin.*push' \
        | sed -r 's/^.*:(.+)\.git.*$/\1/')
    if [ -z "$repo" ]; then
        repo=$(git remote -v 2>/dev/null \
            | egrep 'origin.*push' \
            | sed -r 's/^.*:(.+) \(push\)$/\1/')
    fi

    # If the repo has a / in it, get the second part of it.
    if echo "$repo" | grep -q '/'; then
        repo=$(echo "$repo" | cut -d '/' -f 2)
    fi

    a=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ -n "$a" ]; then
        echo "git:${repo}/%F{yellow}${a}%f "
    else
        echo ""
    fi
}

function fvim() {
    vim -o `fzf`
}

# Prompt configuration.
NL=$'\n'
PROMPT="{ %F{green}%n%f@%F{green}%m%f %1~ } > "
RPROMPT="\$(brname)[%?]"

# Source fuzzy finder if it is installed.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Source .zsh.greet if it is present.
[ -f ~/.zsh.greet ] && source ~/.zsh.greet

export MPD_HOST="mpd.local.net"

function aurbase() {
    export PYTHONPATH=$(pwd)/..
}

function uviaur() {
    AUR_CONFIG=/etc/aurweb/config uvicorn aurweb.asgi:app --reload --log-level debug
}

function activate() {
    source ./venv/bin/activate
}

function py_installed() {
    pip freeze
}

function aurweb-test() {
    rm -f .coverage
    AUR_CONFIG=conf/config make -C test
    coverage report
    coverage html
    firefox htmlcov/index.html
}

function glog() {
    git log --pretty=oneline "$@"
}

# Requires nvm to be installed.
source $HOME/.nvm/nvm.sh
nvm use 14.14.0

