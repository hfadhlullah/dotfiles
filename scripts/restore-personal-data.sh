#!/usr/bin/env bash
set -euo pipefail

BACKUP_ROOT="${1:-/mnt/adata-sx8200/home-backup/rzr/machine-backup}"

rsync -a "$BACKUP_ROOT/ssh/" "$HOME/.ssh/"
rsync -a "$BACKUP_ROOT/gnupg/" "$HOME/.gnupg/"
rsync -a "$BACKUP_ROOT/zen/profile/" "$HOME/.zen/lqw2ej9y.Default (release)/"
rsync -a "$BACKUP_ROOT/zen/cache/" "$HOME/.cache/zen/lqw2ej9y.Default (release)/"
rsync -a "$BACKUP_ROOT/zen/profiles.ini" "$HOME/.zen/profiles.ini"
rsync -a "$BACKUP_ROOT/zen/installs.ini" "$HOME/.zen/installs.ini"
rsync -a "$BACKUP_ROOT/chromium/" "$HOME/.config/chromium/"
rsync -a "$BACKUP_ROOT/opencode/config/" "$HOME/.config/opencode/"
rsync -a "$BACKUP_ROOT/opencode/share/" "$HOME/.local/share/opencode/"
rsync -a "$BACKUP_ROOT/opencode/state/" "$HOME/.local/state/opencode/"
rsync -a "$BACKUP_ROOT/opencode/cache/" "$HOME/.cache/opencode/"

printf 'Restore completed from %s\n' "$BACKUP_ROOT"
