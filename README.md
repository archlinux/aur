```
# Test
namcap PKGBUILD
makepkg -fc
rm -f .SRCINFO
makepkg --printsrcinfo > .SRCINFO
namcap *.zst

# Install Test
sudo pacman -U *.tar.zst

# Publish
git add --all
git commit -m "useful commit message"
git push github
git push
```
