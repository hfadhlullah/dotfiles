#!/usr/bin/env bash
set -euo pipefail

BACKUP_ROOT="${1:-/mnt/adata-sx8200/home-backup/rzr/machine-backup}"

need_cmd() {
  command -v "$1" >/dev/null 2>&1 || {
    printf 'Missing required command: %s\n' "$1" >&2
    exit 1
  }
}

need_cmd gum
need_cmd rsync

if [[ ! -d "$BACKUP_ROOT" ]]; then
  printf 'Backup root not found: %s\n' "$BACKUP_ROOT" >&2
  exit 1
fi

restore_git() {
  mkdir -p "$HOME/.config/gh"
  [[ -f "$BACKUP_ROOT/git/git-credentials" ]] && rsync -a "$BACKUP_ROOT/git/git-credentials" "$HOME/.git-credentials"
  [[ -d "$BACKUP_ROOT/git/gh" ]] && rsync -a "$BACKUP_ROOT/git/gh/" "$HOME/.config/gh/"
}

restore_ssh() {
  mkdir -p "$HOME/.ssh"
  rsync -a "$BACKUP_ROOT/ssh/" "$HOME/.ssh/"
}

restore_gnupg() {
  mkdir -p "$HOME/.gnupg"
  rsync -a "$BACKUP_ROOT/gnupg/" "$HOME/.gnupg/"
}

restore_zen() {
  mkdir -p "$HOME/.zen/lqw2ej9y.Default (release)" "$HOME/.cache/zen/lqw2ej9y.Default (release)"
  rsync -a "$BACKUP_ROOT/zen/profile/" "$HOME/.zen/lqw2ej9y.Default (release)/"
  rsync -a "$BACKUP_ROOT/zen/cache/" "$HOME/.cache/zen/lqw2ej9y.Default (release)/"
  [[ -f "$BACKUP_ROOT/zen/profiles.ini" ]] && rsync -a "$BACKUP_ROOT/zen/profiles.ini" "$HOME/.zen/profiles.ini"
  [[ -f "$BACKUP_ROOT/zen/installs.ini" ]] && rsync -a "$BACKUP_ROOT/zen/installs.ini" "$HOME/.zen/installs.ini"
}

restore_chromium() {
  mkdir -p "$HOME/.config/chromium"
  rsync -a "$BACKUP_ROOT/chromium/" "$HOME/.config/chromium/"
}

restore_opencode() {
  mkdir -p "$HOME/.config/opencode" "$HOME/.local/share/opencode" "$HOME/.local/state/opencode" "$HOME/.cache/opencode"
  rsync -a "$BACKUP_ROOT/opencode/config/" "$HOME/.config/opencode/"
  rsync -a "$BACKUP_ROOT/opencode/share/" "$HOME/.local/share/opencode/"
  rsync -a "$BACKUP_ROOT/opencode/state/" "$HOME/.local/state/opencode/"
  rsync -a "$BACKUP_ROOT/opencode/cache/" "$HOME/.cache/opencode/"
}

choices=$(gum choose --no-limit \
  "Git + GitHub CLI" \
  "SSH" \
  "GPG" \
  "Zen active profile" \
  "Chromium" \
  "OpenCode" \
  "Everything")

[[ -z "$choices" ]] && {
  printf 'Nothing selected.\n'
  exit 0
}

if grep -qx 'Everything' <<<"$choices"; then
  choices=$'Git + GitHub CLI\nSSH\nGPG\nZen active profile\nChromium\nOpenCode'
fi

gum confirm "Restore selected data from $BACKUP_ROOT? Make sure apps are closed." || exit 0

while IFS= read -r choice; do
  case "$choice" in
    "Git + GitHub CLI") restore_git ;;
    "SSH") restore_ssh ;;
    "GPG") restore_gnupg ;;
    "Zen active profile") restore_zen ;;
    "Chromium") restore_chromium ;;
    "OpenCode") restore_opencode ;;
  esac
done <<<"$choices"

gum style --foreground 10 "Restore completed."
gum style --foreground 214 "Next checks: gh auth status, ssh -T github.com, open Zen/OpenCode after restore."
