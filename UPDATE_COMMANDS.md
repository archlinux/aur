# Quick AUR Update Steps

```bash
# 1. Tag and push to GitHub
cd /home/kirik/Code/varchiver
git tag -a v0.1.1 -m "Release 0.1.1"
git push origin v0.1.1

# 2. Update PKGBUILD and push to AUR
cd /home/kirik/Code/aur-packages/varchiver
updpkgsums  # Updates checksums automatically
makepkg --printsrcinfo > .SRCINFO
git add PKGBUILD .SRCINFO
git commit -m "upgpkg: varchiver 0.1.1-1"
git push
```

Note: Remember to update `pkgver=0.1.1` in PKGBUILD first!

## Common Issues and Solutions

1. If `updpkgsums` fails:
   - Manually download the source and calculate sha256sum:
   ```bash
   wget https://github.com/instancer-kirik/Varchiver/archive/v0.1.1.tar.gz
   sha256sum v0.1.1.tar.gz
   ```
   - Update sha256sums in PKGBUILD

2. If build fails:
   - Check the build log in `/tmp/makepkg-*`
   - Test install dependencies: `pacman -S --needed $(pacman -Si varchiver | grep Depends | cut -d: -f2)`

3. If AUR push fails:
   - Ensure SSH key is added: `ssh-add ~/.ssh/aur`
   - Check remote: `git remote -v`
   - Should be: `origin ssh://aur@aur.archlinux.org/varchiver.git`
