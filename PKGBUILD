# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=renpy-sdk
pkgver=7.4.4
pkgrel=1
pkgdesc="The Ren'Py Visual Novel Engine SDK"
arch=(any)
url=https://www.renpy.org
license=(custom)
depends=(renpy)
options=(!strip)
source=(http://www.renpy.org/dl/${pkgver}/renpy-${pkgver}-sdk.tar.bz2)
sha256sums=('1ccf92e56be086b9b17127f7296b70d373b0a703e1a6c50798d4fb7d4e74043c')

package() {
  cd renpy-${pkgver}-sdk

  install -dm 755 "${pkgdir}"/usr/share/renpy

  cp -dr --no-preserve=ownership lib renpy.exe renpy.sh "${pkgdir}"/usr/share/renpy/
}

# vim: ts=2 sw=2 et:
