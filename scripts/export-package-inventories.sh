#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"
PACKAGES_DIR="$DOTFILES_DIR/packages"

mkdir -p "$PACKAGES_DIR"

pacman -Qqe > "$PACKAGES_DIR/pacman-explicit.txt"

if command -v flatpak >/dev/null 2>&1; then
  flatpak list --app --columns=application > "$PACKAGES_DIR/flatpak-installed.txt"
fi

cat > "$PACKAGES_DIR/runtime-paths.txt" <<EOF
forge=$(command -v forge 2>/dev/null || true)
node=$(command -v node 2>/dev/null || true)
npm=$(command -v npm 2>/dev/null || true)
bun=$(command -v bun 2>/dev/null || true)
flutter=$(command -v flutter 2>/dev/null || true)
adb=$(command -v adb 2>/dev/null || true)
EOF

printf 'Wrote inventories to %s\n' "$PACKAGES_DIR"
