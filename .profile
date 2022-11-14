#!/bin/sh
# Commonly used
alias c='clear'
alias pnr='pnpm run'
alias yr='yarn run'

# Git Aliases
alias gad='git add'
alias gbr='git branch'
alias gco='git checkout'
alias gcm='git commit'
alias gff='git pull --ff-only'
alias gnb='git switch -c' # create new branch
alias gp='git push'
alias gph='git push -u origin HEAD'
alias gst='git rev-parse --git-dir > /dev/null 2>&1 && git status || ll'
alias gsw='git switch'

# Utilities
alias jj='pbpaste | jsonpp | pbcopy'
alias jjj='pbpaste | jsonpp | jq'

take() {
    mkdir -p "$1"
    cd "$1" || exit
}

note() {
    if [ $# -eq 0 ]; then
        if [ -f "$HOME/drafts.txt" ]; then
            cat "$HOME/drafts.txt"
        else
            echo 'No current note.'
        fi
    else
        {
            echo "date: $(date)"
            echo "$@"
            echo ""
        } >> "$HOME/drafts.txt";
    fi
}