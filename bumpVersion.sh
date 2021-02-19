makepkg
git add .
git commit -m "bumped version to $(git rev-list --count HEAD)"
git push
