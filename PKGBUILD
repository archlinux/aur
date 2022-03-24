# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=renpy-sdk
pkgver=7.4.11
pkgrel=1
pkgdesc="The Ren'Py Visual Novel Engine SDK"
arch=(any)
url=https://www.renpy.org
license=(custom)
depends=(renpy)
options=(!strip)
source=(http://www.renpy.org/dl/${pkgver}/renpy-${pkgver}-sdk.tar.bz2)
sha256sums=('a73378f06a5925ea0d163b5825c298ed65dafb3d0cdccd9f34d7eace46adef1f')

package() {
  cd renpy-${pkgver}-sdk

  install -dm 755 "${pkgdir}"/usr/share/renpy

  cp -dr --no-preserve=ownership lib renpy.exe renpy.sh "${pkgdir}"/usr/share/renpy/
}

# vim: ts=2 sw=2 et:
