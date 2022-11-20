# Maintainer: hu3rror <hu3rror@protonmail.com>

pkgname=catppuccin-mocha-light-cursors
_pkgname=Catppuccin-Mocha-Light-Cursors
pkgver=1.00
pkgrel=1
pkgdesc="Catppuccin mocha light cursors, Soothing pastel mouse cursors"
arch=('any')
url="https://github.com/catppuccin/cursors"
license=("GPL")
source=("https://github.com/catppuccin/cursors/raw/main/cursors/Catppuccin-Mocha-Light-Cursors.zip")
sha256sums=('5ed54bff8478cf79219bb8510a69b7e4b164a0eb925b8d98622f2074bc602340')

package() {
  install -Ddm755 "${pkgdir}/usr/share/icons"

  cd ${srcdir}
  cp -r ${_pkgname} "${pkgdir}/usr/share/icons/"
}
