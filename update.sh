#!/usr/bin/env bash
# Description: This is a script to update the version
# Run it with `sh update.sh` and it will do the following:
# 1. Update the `pkgver` in `PKGBUILD` to the latest version
# 2. Run `updpkgsums` to update the sha256 sums
# 	- If you don't have it installed, run `sudo pacman -S pacman-contrib`
# 3. Update the `.SRCINFO` by running:
# ```bash
# # This is the file that is used by the AUR to show package info.
# makepkg --printsrcinfo > .SRCINFO
# ```
# 4. Push changes to GitHub: `git push`
# If you want to perform a dry run of this script run DRY_RUN=1 yarn release:prep

set -euo pipefail

main() {
  # Check that they have updpkgsums installed
  if ! command -v updpkgsums &>/dev/null; then
    echo "updpkgsums could not be found."
    echo "This is needed to update the sha256 sums"
    echo -e "Installing for you with: sudo pacman -S pacman-contrib"
    sudo pacman -S pacman-contrib --noconfirm
  fi

  ls
  echo $(grep "pkgver=" PKGBUILD)
  CODE_SERVER_CURRENT_VERSION=$(grep "pkgver=" PKGBUILD | cut -d "=" -f2-)
  # Ask which version we should update to
  # In the future, we'll automate this and determine the latest version automatically
  echo "Current version: ${CODE_SERVER_CURRENT_VERSION}"

  read -r -p "What version of code-server do you want to update to?"$'\n' CODE_SERVER_VERSION_TO_UPDATE

  echo -e "Great! We'll update to $CODE_SERVER_VERSION_TO_UPDATE\n"

  sed -i "s/$CODE_SERVER_CURRENT_VERSION/$CODE_SERVER_VERSION_TO_UPDATE/" PKGBUILD

  updpkgsums

  makepkg --printsrcinfo > .SRCINFO

  echo "All updated!"
  echo "Committing and pushing to GitHub"
  git add .
  git commit -m "chore: updating version $CODE_SERVER_VERSION_TO_UPDATE"
  echo "Action requried: make sure to push to aur: git push aur"

main "$@"
