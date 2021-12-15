```
# Test
makepkg -fci
namcap PKGBUILD
namcap *.zst

# Publish
makepkg --printsrcinfo > .SRCINFO
git add --all
git commit -m "useful commit message"
git push
```
