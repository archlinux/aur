# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=renpy-sdk
pkgver=7.4.0
pkgrel=1
pkgdesc="The Ren'Py Visual Novel Engine SDK"
arch=(any)
url=https://www.renpy.org
license=(custom)
depends=(renpy)
options=(!strip)
source=(http://www.renpy.org/dl/${pkgver}/renpy-${pkgver}-sdk.tar.bz2)
sha256sums=('fa3bd48308573dcfd5028882d1c71423c04efae6e6f3dbc9b8b520313cfc5790')

package() {
  cd renpy-${pkgver}-sdk

  install -dm 755 "${pkgdir}"/usr/share/renpy

  cp -dr --no-preserve=ownership lib renpy.exe renpy.sh "${pkgdir}"/usr/share/renpy/
}

# vim: ts=2 sw=2 et:
