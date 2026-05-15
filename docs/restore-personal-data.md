# Personal Data Restore Guide

Restore these only while the related applications are fully closed.

## Recommended restore flow

Use the interactive TUI restore script:

```bash
scripts/restore-personal-data-tui.sh
```

You can choose exactly what to restore:

- Git + GitHub CLI
- SSH
- GPG
- Zen active profile
- Chromium
- OpenCode

For non-interactive full restore, you can still use:

```bash
scripts/restore-personal-data.sh
```

## Git And GitHub CLI

Restore:

- `~/.git-credentials`
- `~/.config/gh/`

After restore:

- run `gh auth status`
- consider rotating any plaintext Git token if it was backed up from `~/.git-credentials`

## SSH and GPG

Restore:

- `~/.ssh/`
- `~/.gnupg/`

## Zen

Restore:

- `~/.zen/lqw2ej9y.Default (release)/`
- `~/.cache/zen/lqw2ej9y.Default (release)/`
- `~/.zen/profiles.ini`
- `~/.zen/installs.ini`

## Chromium

Restore:

- `~/.config/chromium/`

## OpenCode

Restore:

- `~/.config/opencode/`
- `~/.local/share/opencode/`
- `~/.local/state/opencode/`
- `~/.cache/opencode/`

## Suggested order after reinstall

1. Install base packages (`git`, `stow`).
2. Clone `~/dotfiles`.
3. Run `./setup-2.sh`.
4. Run `scripts/bootstrap-packages.sh`.
5. Run `scripts/restore-personal-data-tui.sh` and select what you want.
6. Reinstall manual tools from `packages/manual-tools.md`.
7. Open terminal and verify `zsh`, `starship`, `tmux`, `nvim`.
8. Open Zen and OpenCode only after their data has been restored.
