#!/usr/bin/env bash
set -euo pipefail

BACKUP_ROOT="${1:-/mnt/adata-sx8200/home-backup/rzr/machine-backup}"
ZEN_PROFILE_ROOT="$HOME/.zen/lqw2ej9y.Default (release)"
ZEN_PROFILE_CACHE="$HOME/.cache/zen/lqw2ej9y.Default (release)"

mkdir -p \
  "$BACKUP_ROOT/git/gh" \
  "$BACKUP_ROOT/ssh" \
  "$BACKUP_ROOT/gnupg" \
  "$BACKUP_ROOT/zen/profile" \
  "$BACKUP_ROOT/zen/cache" \
  "$BACKUP_ROOT/chromium" \
  "$BACKUP_ROOT/opencode/config" \
  "$BACKUP_ROOT/opencode/share" \
  "$BACKUP_ROOT/opencode/state" \
  "$BACKUP_ROOT/opencode/cache" \
  "$BACKUP_ROOT/manifests"

rsync -a "$HOME/.git-credentials" "$BACKUP_ROOT/git/git-credentials"
rsync -a --delete "$HOME/.config/gh/" "$BACKUP_ROOT/git/gh/"
rsync -a --delete "$HOME/.ssh/" "$BACKUP_ROOT/ssh/"
rsync -a --delete "$HOME/.gnupg/" "$BACKUP_ROOT/gnupg/"
rsync -a --delete "$ZEN_PROFILE_ROOT/" "$BACKUP_ROOT/zen/profile/"
rsync -a --delete "$ZEN_PROFILE_CACHE/" "$BACKUP_ROOT/zen/cache/"
rsync -a "$HOME/.zen/profiles.ini" "$BACKUP_ROOT/zen/profiles.ini"
rsync -a "$HOME/.zen/installs.ini" "$BACKUP_ROOT/zen/installs.ini"
rsync -a --delete "$HOME/.config/chromium/" "$BACKUP_ROOT/chromium/"
rsync -a --delete "$HOME/.config/opencode/" "$BACKUP_ROOT/opencode/config/"
rsync -a --delete "$HOME/.local/share/opencode/" "$BACKUP_ROOT/opencode/share/"
rsync -a --delete "$HOME/.local/state/opencode/" "$BACKUP_ROOT/opencode/state/"
rsync -a --delete "$HOME/.cache/opencode/" "$BACKUP_ROOT/opencode/cache/"

printf 'Backup completed to %s\n' "$BACKUP_ROOT"
