# /bin/bash
set +e
sudo pacman -R symfony-cli --noconfirm
sudo pacman -R symfony-cli-debug --noconfirm
set -e
rm -rf src
rm -rf pkg
rm -rf symfony-cli-bin-*.gz
rm -rf symfony-cli-bin-*.tar.zst
updpkgsums
makepkg -si --noconfirm
makepkg --printsrcinfo > .SRCINFO
set +e
git add .
git commit -m "update package"
git push
git remote add arch ssh://aur@aur.archlinux.org/symfony-cli-bin.git
git push arch
