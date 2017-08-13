# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=dune2-data
pkgver=1.07
pkgrel=1
pkgdesc="Data files of the original Dune II game"
arch=('any')
url="http://duneii.com"
license=('custom')
source=("Dune2.exe::https://nahoo.net/cgi-bin/download/load.cgi?games/dune2/Dune2.exe")
sha256sums=("4363e058bd3c16bfb58f40e8487d281a9e747756022acd955fb5f9b5a26b5807")

package() {
  cd "$srcdir"
  install -d "$pkgdir"/usr/share/games/dune2/data/
  cp *.PAK *.DAT *.EXE *.CFG *.ICO *.ENG *.txt *.icl "$pkgdir"/usr/share/games/dune2/data/
}

# vim:set ts=2 sw=2 et:
