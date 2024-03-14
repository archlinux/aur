# /bin/bash
set +e
sudo pacman -R symfony-cli-bin --noconfirm
sudo pacman -R symfony-cli-bin-debug --noconfirm
set -e
rm -rf src
rm -rf pkg
rm -rf symfony-cli-*.gz
rm -rf symfony-cli-*.tar.zst
updpkgsums
makepkg -si --noconfirm
makepkg --printsrcinfo > .SRCINFO
set +e
git add .
git commit -m "update package"
git push
git remote add arch ssh://aur@aur.archlinux.org/symfony-cli.git
git push arch
