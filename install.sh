#!/bin/bash
set -e

DOTFILES_DIR="$HOME/.dotfiles"

# --- Source setup.zsh from ~/.zshrc ---
SOURCE_LINE='source "${HOME}/.dotfiles/setup.zsh"'
if ! grep -qF "$SOURCE_LINE" "$HOME/.zshrc" 2>/dev/null; then
  echo "Adding source line to ~/.zshrc..."
  echo "" >> "$HOME/.zshrc"
  echo "$SOURCE_LINE" >> "$HOME/.zshrc"
else
  echo "~/.zshrc already sources setup.zsh, skipping."
fi

# --- Symlink configs ---
SYMLINK_APPS=($(ls "$DOTFILES_DIR/symlinks/"))
for app in "${SYMLINK_APPS[@]}"; do
  if [ -d "$HOME/.config/$app" ]; then
    echo "Symlinking $app config..."
    for f in "$DOTFILES_DIR/symlinks/$app/"*; do
      target="$HOME/.config/$app/$(basename "$f")"
      if [ -L "$target" ]; then
        echo "  -> $(basename "$f") already linked, skipping."
      else
        ln -s "$f" "$target"
        echo "  -> Linked $(basename "$f")"
      fi
    done
  else
    echo "~/.config/$app not found, skipping $app symlinks."
  fi
done

echo ""
echo "Done! Restart your shell or run: source ~/.zshrc"
