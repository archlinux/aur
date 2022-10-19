# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=renpy-sdk
pkgver=8.0.1
pkgrel=1
pkgdesc="The Ren'Py Visual Novel Engine SDK"
arch=(any)
url=https://www.renpy.org
license=(custom)
depends=(renpy)
options=(!strip)
source=(http://www.renpy.org/dl/${pkgver}/renpy-${pkgver}-sdk.tar.bz2)
sha256sums=('a2a580821a7a20c93437154f5933ec70c9f991a55e0d0af47392131fb1464c23')

package() {
  cd renpy-${pkgver}-sdk

  install -dm 755 "${pkgdir}"/usr/share/renpy

  cp -dr --no-preserve=ownership lib renpy.exe renpy.sh "${pkgdir}"/usr/share/renpy/
}

# vim: ts=2 sw=2 et:
