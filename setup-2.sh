#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$HOME/dotfiles"

echo "🔗 Setting up dotfiles with GNU Stow..."

# Ensure dotfiles directory exists
if [[ ! -d "$DOTFILES_DIR" ]]; then
  echo "❌ Dotfiles directory not found: $DOTFILES_DIR"
  exit 1
fi

cd "$DOTFILES_DIR"

# Ensure stow is installed
if ! command -v stow >/dev/null 2>&1; then
  echo "❌ GNU Stow is not installed. Install it first."
  exit 1
fi

# Explicit allow-list (SAFE)
APPS=(
  ghostty
  niri
  nvim
  rofi
  waybar
  starship
  tmux
  zsh
)

for app in "${APPS[@]}"; do
  if [[ -d "$app" ]]; then
    echo "   -> Stowing $app"
    stow -R "$app"
  else
    echo "⚠️  Skipping $app (not found)"
  fi
done

echo "✅ All dotfiles successfully linked."
