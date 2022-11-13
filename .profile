
alias gad='git add'
alias gbr='git branch'
alias gco='git checkout'
alias gst='git rev-parse --git-dir > /dev/null 2>&1 && git status || ll'
alias gcm='git commit'
alias gpl='git pull'
alias gsw='git switch'

alias pnr='pnpm run'

function take {
    mkdir -p $1
    cd $1
}