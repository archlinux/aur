makepkg -f
makepkg --printsrcinfo > .SRCINFO
git add .
git commit -m "bumped version to r$(git rev-list --count HEAD)"
git push
