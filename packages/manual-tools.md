# Manual Tools And Restore Notes

## User-installed tools

- `forge`: `~/.local/bin/forge`
- `nvm`: restore/install separately, current shell uses Node from `~/.nvm/versions/node/`
- Flutter SDK: `~/tools/flutter`
- Android SDK: `~/Android/Sdk`

## Browser profile locations

- Zen active profile root: `~/.zen/lqw2ej9y.Default (release)/`
- Zen active profile cache: `~/.cache/zen/lqw2ej9y.Default (release)/`
- Zen metadata: `~/.zen/profiles.ini`, `~/.zen/installs.ini`
- Chromium profile root: `~/.config/chromium/`

## OpenCode restore locations

- Config: `~/.config/opencode/`
- Share/data: `~/.local/share/opencode/`
- State/history: `~/.local/state/opencode/`
- Cache: `~/.cache/opencode/`

## SSH and GPG

- SSH: `~/.ssh/`
- GPG: `~/.gnupg/`

## Git auth state

- Git credentials: `~/.git-credentials`
- GitHub CLI config/auth: `~/.config/gh/`

## Notes

- `dotfiles` restore your shell/editor/terminal config, but not SDK contents.
- Reinstall package dependencies before expecting all shell config commands to work.
- Restore browser and OpenCode data only while those applications are fully closed.
