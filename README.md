To get version:
 curl https://info.identitaobcana.cz/Download/ | grep "Aktuální verze SW eObčanka pro Linux je:"

To update md5sums array:
  makepkg -g -f -p PKGBUILD >> PKGBUILD

To update SRCINFO:
  makepkg --printsrcinfo > .SRCINFO
