# Post-install Checklist

1. Install `git` and `stow`.
2. Clone `~/dotfiles`.
3. Run `./setup-2.sh`.
4. Run `scripts/bootstrap-packages.sh`.
5. Run `scripts/restore-personal-data-tui.sh`.
6. Select the backups you want to restore.
7. Reinstall/manual-restore:
   - `forge`
   - `nvm` and Node version
   - Flutter SDK
   - Android SDK
8. Verify expected commands from `packages/expected-tools.txt`.
9. Run `gh auth status` if you restored GitHub CLI.
10. Log out/in if desktop or session settings are missing.
