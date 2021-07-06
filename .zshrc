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
alias gitgrep="git log --pretty=oneline | grep $@"

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

function _deploy() {
    if [ -f './scripts/deploy.sh' ]; then
        DEPLOY='./scripts/deploy.sh'
    elif [ -f '../scripts/deploy.sh' ]; then
        DEPLOY='../scripts/deploy.sh'
    else
        echo 'error: no $DEPLOY script found'
        return 1
    fi
    bash $DEPLOY "$@"
}

function nano_deploy() {
    export PORT='/dev/ttyUSB0'
    export PART='atmega328p'
    export PROGRAMMER='arduino'
    export BAUD=115200
    _deploy "$@"
}

function mega_deploy() {
    export PORT='/dev/ttyACM0'
    export PART='atmega2560'
    export PROGRAMMER='wiring'
    export BAUD=115200
    _deploy "$@"
}

function siglent_screenshot() {
    rm -f /tmp/siglent.bmp
    lxi screenshot /tmp/siglent.bmp \
        --address 192.168.0.91 \
        --plugin siglent-sds >/dev/null 2>&1 | grep -q '^convert-.*:'
    convert /tmp/siglent.bmp "$1"
}

function ffind() {
    find . -type f "$@"
}

function dfind() {
    find . -type d "$@"
}

function mastermerge() {
    git checkout master
    git pull origin master
    git checkout "$1"
    git merge master
    git push origin "$1"
}

function aurtest() {
    rm -f .coverage
    echo "Initializing test DB..."
    rm -f aurweb.sqlite3
    AUR_CONFIG=conf/config python3 -m aurweb.initdb
    AUR_CONFIG=conf/config coverage run $(which pytest) "$@" test
}

# Requires nvm to be installed.
source $HOME/.nvm/nvm.sh
nvm use 14.14.0

export GIT_SSH_COMMAND='ssh -4'

source "$HOME/.zsh.functions"
source "$HOME/.zsh.aliases"

# If .envrc exists in the directory where zsh starts, source it.
[[ -f .envrc ]] && source .envrc
export PYTHONPATH
export AUR_CONFIG

export PYTHONPATH="${PYTHONPATH}:/home/kevr/.local/lib/python3.9/site-packages"

# Drop the user into pyenv virtualenv.
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
source $(pyenv root)/versions/venv/bin/activate
