#!/bin/bash
set -e

DOTFILES_DIR="$HOME/.dotfiles"

# --- Create private aliases ---
PRIVATE="$DOTFILES_DIR/aliases/private.zsh"
echo ""
echo "Creating private.zsh:"
if [ ! -f "$PRIVATE" ]; then
  cat > "$PRIVATE" << 'EOF'
# All variables required; examples provided.

PROJECT_CLIENT_DIR=~/code/client-repo
PROJECT_CLIENT_RUN='npm run dev'
PROJECT_CLIENT_TEST='npm run test "$@"'

PROJECT_SERVER_DIR=~/code/server-repo
PROJECT_SERVER_RUN='bundle exec rails start'
PROJECT_SERVER_TEST='bundle exec rspec "$@"'

UPDATE_ALL_PROJECTS='(cd ${PROJECT_CLIENT_DIR} && git checkout main && git pull && npm install && git checkout -) && (cd ${PROJECT_SERVER_DIR} && git checkout main && git pull && bundle install && bundle exec rake db:migrate && git checkout -)'
EOF
  echo "  ✅ private.zsh created; update as needed"
else
  echo "  ✅ private.zsh already exists"
fi

# --- Source setup.zsh from ~/.zshrc ---
SOURCE_LINE='source "${HOME}/.dotfiles/setup.zsh"'
echo ""
echo "Sourcing setup.zsh from .zshrc:"
if ! grep -qF "$SOURCE_LINE" "$HOME/.zshrc" 2>/dev/null; then
  echo "  ⏳ Adding source line to .zshrc:"
  echo "" >> "$HOME/.zshrc"
  echo "$SOURCE_LINE" >> "$HOME/.zshrc"
  echo "  ✅ setup.zsh sourced from .zshrc"
else
  echo "  ✅ .zshrc already sources setup.zsh"
fi

# --- Symlink configs ---
SYMLINK_APPS=($(ls "$DOTFILES_DIR/symlinks/"))
for app in "${SYMLINK_APPS[@]}"; do
  if [ -d "$HOME/.config/$app" ]; then
    echo ""
    echo "Symlinking $app config:"
    for f in "$DOTFILES_DIR/symlinks/$app/"*; do
      target="$HOME/.config/$app/$(basename "$f")"
      if [ -L "$target" ]; then
        echo "  ✅ $(basename "$f") already linked"
      else
        ln -s "$f" "$target"
        echo "  ✅ $(basename "$f") linked"
      fi
    done
  else
    echo "  🤔 ~/.config/$app not found, skipping $app symlinks"
  fi
done

echo ""
echo "Done! Restart your shell or run: source ~/.zshrc"
