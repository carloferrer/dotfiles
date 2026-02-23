# dotfiles

Probs not the best dotfiles setup, but it's mine, and gets the job done.

### Setting Up

#### 1. Clone this repo
```
cd && git clone git@github.com:carloferrer/dotfiles.git && mv ./dotfiles ./.dotfiles
```

#### 2. Define `./aliases/private.zsh`
Some aliases assume one repo for each of client and server. For these functions to work, create `./aliases/private.zsh` and define the following there, e.g.,
```
# ./aliases/private.zsh
# All variables required; example values provided

PROJECT_CLIENT_DIR=~/code/client-repo
PROJECT_CLIENT_RUN='npm run dev'
PROJECT_CLIENT_TEST='npm run test "$@"'

PROJECT_SERVER_DIR=~/code/server-repo
PROJECT_SERVER_RUN='bundle exec rails start'
PROJECT_SERVER_TEST='bundle exec rspec "$@"'

UPDATE_ALL_PROJECTS='(cd ${PROJECT_CLIENT_DIR} && git checkout main && git pull && npm install && git checkout -) && (cd ${PROJECT_SERVER_DIR} && git checkout main && git pull && bundle install && bundle exec rake db:migrate && git checkout -)'
```

#### 3. Import setup at `~/.zshrc`
At `~/.zshrc`, add this:
```
source "~/.dotfiles/setup.zsh"
```

#### 4. Symlink kitty config
Assuming the "kitty" terminal emulator is installed, do this:
```
ln -s ~/.dotfiles/kitty/* ~/.config/kitty
```