# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=renpy-sdk
pkgver=7.4.7
pkgrel=1
pkgdesc="The Ren'Py Visual Novel Engine SDK"
arch=(any)
url=https://www.renpy.org
license=(custom)
depends=(renpy)
options=(!strip)
source=(http://www.renpy.org/dl/${pkgver}/renpy-${pkgver}-sdk.tar.bz2)
sha256sums=('768d3a3094742033457cd59eb6746c5cc9bf9e21a1c46f4685c196ef9548375b')

package() {
  cd renpy-${pkgver}-sdk

  install -dm 755 "${pkgdir}"/usr/share/renpy

  cp -dr --no-preserve=ownership lib renpy.exe renpy.sh "${pkgdir}"/usr/share/renpy/
}

# vim: ts=2 sw=2 et:
