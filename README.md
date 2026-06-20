# material-gnome-manager-git

AUR packaging for Material GNOME Manager.

## Build Locally

```bash
makepkg -si
```

## Publish

After the application repository is pushed to GitHub:

```bash
makepkg --printsrcinfo > .SRCINFO
git add PKGBUILD .SRCINFO README.md .gitignore
git commit -m "Initial import"
git push
```
