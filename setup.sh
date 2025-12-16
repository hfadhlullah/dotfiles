#!/bin/bash

# Navigate to the dotfiles directory
cd "$HOME/dotfiles" || exit

# List of folders to stow (add new ones here if needed)
# The */ pattern automatically grabs all folders
echo "🔗 Stowing dotfiles..."

for folder in */; do
  # Remove the trailing slash (e.g., "nvim/" -> "nvim")
  app_name=$(basename "$folder")

  # Skip the .git folder
  if [ "$app_name" == ".git" ]; then
    continue
  fi

  echo "   -> Stowing $app_name"
  stow -R "$app_name"
done

echo "✅ All done! Configs linked."
