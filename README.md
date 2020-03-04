# git-req AUR package

[The `git-req` source is here](https://github.com/arusahni/git-req).

## Repo Recipes

#### Add the AUR repo (assuming this repo is cloned)

```bash
git remote add aur ssh://aur@aur.archlinux.org/git-req.git
git fetch aur
```

#### Bumping the app version

1. Set `pkgver` in the `PKGBUILD`
2. Get the new sha256sums: `makepkg -g`
3. Update the `sha256sums` line in the `PKGBUILD`
4. Test by running `makepkg`
5. Update the `.SRCINFO` file: `makepkg --printsrcinfo > .SRCINFO`
6. Add and commit the `PKGBUILD` and `.SRCINFO` files
7. Push to GitHub and AUR: `git push && git push aur master`
