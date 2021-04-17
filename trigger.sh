makepkg --printsrcinfo > .SRCINFO

ver="autohook $(grep pkgver < .SRCINFO | sed 's/.*pkgver = //g')"
ver_msg="autohook $ver"

git commit -am $ver_msg
sed "s/PKGVER/${ver}/g" _service \
 > home:nicman23/thunderbird-appmenu-bin/_service
(
  cd home:nicman23/thunderbird-appmenu-bin/
  osc ci -m $ver_msg
)
