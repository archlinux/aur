sum="$(sha512sum ./mkinitcpio-firmware.hook | awk '{print $1}')"
sed -i "s/sha512sums=(.*)/sha512sums=($sum)/g" ./PKGBUILD

makepkg --printsrcinfo > .SRCINFO
git add .
git commit -m "updated"
git push
