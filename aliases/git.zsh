alias g='git'

alias ga='git add'
alias gcam='git commit -am'
alias gcmsg='git commit -m'

alias gco='git checkout'
alias gcob='git checkout -b'

alias gd='git diff'

alias ggf='ggr --files-with-matches'
alias ggr='git grep'

alias gl='git pull'
alias glo='git log'
alias glu='git log -U0'

alias gp='git push'
alias gpsup='git push --set-upstream origin $(git_branch)'

alias gst='git status'

# Careful!
alias gane!='git commit --am --no-e'
alias gcam!='git commit --am'
alias gcan!='git commit -a --no-edit --amend'
alias gpf!='git push --force-with-lease'

# Handy git branch getter
git_branch() {
  echo "$(command git symbolic-ref --short -q HEAD)"
}
