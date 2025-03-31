```shell
# Get the latest PKGBUILD from the nav remote
git fetch nav
git show nav/master:install/PKGBUILD > PKGBUILD

# Make the package
docker compose run --rm makepkg

# Commit changes
git add PKGBUILD .SRCINFO
git commit -m "Update"

# Push changes to origin and AUR (ssh://aur@aur.archlinux.org/nav-cli.git)
git push origin && git push aur
```