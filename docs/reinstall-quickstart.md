# Reinstall Quickstart

## 1. Base packages

```bash
sudo pacman -S git stow
```

## 2. Clone dotfiles

```bash
git clone <your-dotfiles-repo> ~/dotfiles
cd ~/dotfiles
```

## 3. Restore symlinked configs

```bash
./setup-2.sh
```

## 4. Install package groups

```bash
scripts/bootstrap-packages.sh
```

## 5. Restore personal data interactively

```bash
scripts/restore-personal-data-tui.sh
```

Recommended restore selections:

- Git + GitHub CLI
- SSH
- GPG
- Zen active profile
- Chromium
- OpenCode

## 6. Reinstall manual tools

See:

```text
packages/manual-tools.md
```

Main items:

- `forge`
- `nvm` and Node version
- Flutter SDK
- Android SDK

## 7. Verify essentials

```bash
gh auth status
ssh -T git@github.com
zsh -lic 'echo $STARSHIP_CONFIG'
tmux -V
nvim --version
ghostty +show-config 2>/dev/null | rg '^theme =|^font-family ='
```

## 8. Final session refresh

Log out and back in if desktop/session settings do not apply immediately.
