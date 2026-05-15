#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"
PACKAGES_DIR="$DOTFILES_DIR/packages"

install_list() {
  local file="$1"
  if [[ -f "$file" ]]; then
    mapfile -t pkgs < <(grep -Ev '^(#|\s*$)' "$file")
    if (( ${#pkgs[@]} > 0 )); then
      sudo pacman -S --needed "${pkgs[@]}"
    fi
  fi
}

install_list "$PACKAGES_DIR/core.txt"
install_list "$PACKAGES_DIR/desktop.txt"
install_list "$PACKAGES_DIR/dev.txt"
install_list "$PACKAGES_DIR/fonts.txt"

if command -v flatpak >/dev/null 2>&1 && [[ -f "$PACKAGES_DIR/flatpak.txt" ]]; then
  while IFS= read -r app; do
    [[ -z "$app" || "$app" =~ ^# ]] && continue
    flatpak install -y flathub "$app"
  done < "$PACKAGES_DIR/flatpak.txt"
fi

printf '\nManual restore items are documented in %s\n' "$PACKAGES_DIR/manual-tools.md"
