update:
  updpkgsums

test:
  makepkg -Ccsif --noconfirm
  sshping --version

package:
  makepkg --printsrcinfo > .SRCINFO
  jj desc -m "Update to $(grep "^pkgver" PKGBUILD | cut -d "=" -f 2)" 
  jj b s -r=@ master
