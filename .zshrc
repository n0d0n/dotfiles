# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"

# default zsh theme
ZSH_THEME="robbyrussell"

# Just use git and sudo plugins
plugins=(git sudo)

# Use oh-my-zsh
source $ZSH/oh-my-zsh.sh

# nvm to manage node versions
source /usr/share/nvm/init-nvm.sh

# aliases
# vim to neovim
alias vim=nvim

# H1 API key to obtain scopes
export H1_API='YOUR_H1_API_KEY'

# Get scopes for HackerOne programs
function h1-scope {
    if [ -z "$1" ]; then
        echo "Error: missing program handle"
        return 1
    fi
    output="$(mktemp)"
    next_link="https://api.hackerone.com/v1/hackers/programs/$1/structured_scopes" 
    while [[ "$next_link" != "null" ]];
    do
        curl -s $next_link -u "n0d0n:$H1_API" > $output
        next_link=`cat $output | jq -r '.links.next'`
        cat $output | jq -r '.data[] | select (.attributes.eligible_for_submission == true) | .attributes.asset_identifier'
    done
}

# Connect to VPS via SSH
function ssh-vps {
    ssh -i /home/n0d0n/vps root@172.104.253.196
}

# Custom password manager
function pykvault {
    source /home/n0d0n/pykvault/.venv/bin/activate
    python /home/n0d0n/pykvault/pykvault.py "$@"
    deactivate
}

# Start bbwords server
function bbwords-server {
    source /home/n0d0n/bugbounty/bbwords/.venv/bin/activate
    origdir=$PWD
    cd /home/n0d0n/bugbounty/bbwords/
    uvicorn server:app --reload
    deactivate
    cd $origdir
}

# Use bbwords CLI tool
function bbwords {
    source /home/n0d0n/bugbounty/bbwords/.venv/bin/activate
    python /home/n0d0n/bugbounty/bbwords/bbwords.py "$@"
    deactivate
}

# Starts a bug bounty setup with caido, bbwords server and jxscout
function bb-start {
    if [ -z "$1" ]; then
        echo "Error: missing project name"
        return 1
    fi
    caido >/dev/null 2>&1 &
    bbwords-server >/dev/null 2>&1 &
    /home/n0d0n/go/bin/jxscout -project-name $1 -download-refered-js
}

# Opens a completly fresh Firefox session in private mode
function firefox-session {
    firefox --profile $(mktemp -d) --private-window
}

# Start tmux session at start and cleanup when exiting
if [ "$TMUX" = "" ]; then tmux; tmux list-sessions | grep -v attached | awk 'BEGIN{FS=":"}{print $1}' | xargs -n 1 tmux kill-session -t || echo No sessions to kill; fi
