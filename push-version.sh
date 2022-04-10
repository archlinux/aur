# Generate metadata
makepkg --printsrcinfo > .SRCINFO

# Add and push to git
git add PKGBUILD .SRCINFO
git commit
git push
