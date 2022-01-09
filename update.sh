# /bin/bash
set -e
rm -rf src
rm -rf pkg
rm -rf scyther-*.tgz
rm -rf scyther-*.tar.zst
updpkgsums
makepkg -si --noconfirm
makepkg --printsrcinfo > .SRCINFO
set +e
git add .
git commit -m "update package"
git push
git remote add arch ssh://aur@aur.archlinux.org/scyther.git
git push arch
