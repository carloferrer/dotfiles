# dotfiles
Probs not the best dotfiles setup, but it's mine, and gets the job done.

### Setting Up

#### 1. Clone this repo
```
git clone git@github.com:carloferrer/dotfiles.git ~/.dotfiles
```

#### 2. Run install script
```
# Generate aliases/private.zsh
# Source setup.zsh from ~/.zshrc
# Symlink the symlinks/

bash install.sh
```

#### 3. Refine `aliases/private.zsh` to be useful
This file's meant for stuff specific to production projects, so it's purposely untracked.

### TBDs
`tbds/*` need manual work to symlink or get functional; `install.sh` may handle this one day 🤞