ver=$(curl https://api.github.com/repos/razaqq/potatoalert/releases/latest -s | jq .name -r)
echo Updating to $ver
sed -ir "s/pkgver='[0-9]\+\.[0-9]\+\.[0-9]\+'/pkgver='$ver'/g" PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO
