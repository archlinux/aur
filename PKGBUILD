# Maintainer: hu3rror <hu3rror@protonmail.com>

pkgname=catppuccin-mocha-dark-cursors
_pkgname=Catppuccin-Mocha-Dark-Cursors
pkgver=1.00
pkgrel=1
pkgdesc="Catppuccin mocha dark cursors, Soothing pastel mouse cursors"
arch=('any')
url="https://github.com/catppuccin/cursors"
license=("GPL")
source=("https://github.com/catppuccin/cursors/raw/main/cursors/${_pkgname}.zip")
sha256sums=('c270995f54e067275d60c6a4fac6528b991421ea2a192e3ac8f636fdc9c68a54')

package() {
  install -Ddm755 "${pkgdir}/usr/share/icons"

  cd ${srcdir}
  cp -r ${_pkgname} "${pkgdir}/usr/share/icons/"
}
