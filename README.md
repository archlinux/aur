# autohide-tdrop AUR package

[The `autohide-tdrop` source is here](https://github.com/I-Want-ToBelieve/autohide-tdrop). Please report all non-packaging issues there.

## Repo Recipes

#### Add the AUR repo (assuming this repo is cloned)

```bash
git remote add aur ssh://aur@aur.archlinux.org/autohide-tdrop-git.git
git fetch aur
```

#### Push a new release

```bash
makepkg --printsrcinfo > .SRCINFO
git add .SRCINFO
git commit
git push aur main:master
```
