# ./private.zsh is git-ignored for safety and must be manually created
source "${0:a:h}/private.zsh"

alias a='alias | grep'
alias l='ls -a'

# Requires jq
alias jdp="jq .dependencies package.json"
alias jsp="jq .scripts package.json"

# Claude stuff
alias c='claude'
alias cu!='brew upgrade claude-code'

# Pull; install; migrate
alias pim!=${UPDATE_ALL_PROJECTS}

# Run the project in the current directory
alias run=run_local

# Assumes just one directory for each of frontend and backend
run_local() {
  if [ "$PWD" = "${PROJECT_CLIENT_DIR}" ]; then
    eval ${PROJECT_CLIENT_RUN}
  elif [ "$PWD" = "${PROJECT_SERVER_DIR}" ]; then
    eval ${PROJECT_SERVER_RUN}
  else
    echo "directory unrecognized"
  fi
}

alias t=test_local

test_local() {
  if [[ "$1" == client/* ]]; then
    (cd ${PROJECT_CLIENT_DIR} && eval ${PROJECT_CLIENT_TEST} "$@")
  elif [[ "$1" == ${PROJECT_SERVER_DIR}/* ]]; then
    (cd ${PROJECT_SERVER_DIR} && eval ${PROJECT_SERVER_TEST} "$@")
  else
    echo "directory unrecognized"
  fi
}