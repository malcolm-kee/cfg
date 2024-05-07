#!/bin/sh
# Commonly used
alias c='clear'
alias pnr='pnpm run'
alias pnf='pnpm --filter'
alias pni='pnpm install'
alias yr='yarn run'
alias h='history -1000 | grep'

# Git Aliases
alias gad='git add'
alias gbr='git branch'
alias gco='git checkout'
alias gcm='git commit -m'
alias gff='git remote prune origin && git pull --ff-only'
alias glg='git log --oneline -15'
alias gnb='git switch -c' # create new branch
alias gp='git push'
alias gph='git push -u origin HEAD'
alias gst='git rev-parse --git-dir > /dev/null 2>&1 && git status || ll'

gsw() {
    git fetch origin "$1:$1"
    git switch "$1"
}

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

gdf() {
    if git rev-parse --verify main; then
        git switch main
    elif git rev-parse --verify master; then
        git switch master
    else
        echo "No default branch found"
    fi
}

vcompress() {
    outputName="${1%.*}_s"; # exclude file extension and add _s postfix

    while [ -f "${outputName}.mp4" ]
    do
      outputName="${outputName}s"
    done

    ffmpeg -i "$1" -vcodec libx264 -crf 28 "${outputName}.mp4";

    originalFileSizeMb=$(wc -c "$1" | awk '{print $1/1000/1000}')
    finalFileSizeMb=$(wc -c "${outputName}.mp4" | awk '{print $1/1000/1000}')

    echo "Generated ${outputName}.mp4 - ${finalFileSizeMb%.*}MB (original: ${originalFileSizeMb%.*}MB)"
}
