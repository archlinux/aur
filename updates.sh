makepkg --printsrcinfo > .SRCINFO
echo "git add -f PKGBUILD .SRCINFO updates.sh"
echo 'git commit -m " "'
echo "aurpublish ${pkgname}"
echo "git push"
