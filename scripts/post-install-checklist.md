# Post-install Checklist

1. Install `git` and `stow`.
2. Clone `~/dotfiles`.
3. Run `./setup-2.sh`.
4. Run `scripts/bootstrap-packages.sh`.
5. Restore SSH and GPG backups.
6. Restore Zen active profile and Chromium profile.
7. Restore OpenCode config/data/state/cache.
8. Reinstall/manual-restore:
   - `forge`
   - `nvm` and Node version
   - Flutter SDK
   - Android SDK
9. Verify expected commands from `packages/expected-tools.txt`.
10. Log out/in if desktop or session settings are missing.
