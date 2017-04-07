# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=renpy-sdk
pkgver=6.99.12.4
pkgrel=1
pkgdesc="The Ren'Py Visual Novel Engine SDK"
arch=('any')
url='http://www.renpy.org'
license=('custom')
depends=('renpy')
options=('!strip')
source=("http://www.renpy.org/dl/${pkgver}/renpy-${pkgver}-sdk.tar.bz2")
sha256sums=('ee3cd5c014a3d2cc4a7208a6a3812cd5b1614094a7b5548f1a0791b6ec0f07b1')

package() {
  cd renpy-${pkgver}-sdk

  install -dm 755 "${pkgdir}"/usr/share/renpy

  cp -dr --no-preserve='ownership' lib renpy.exe renpy.sh "${pkgdir}"/usr/share/renpy/
}

# vim: ts=2 sw=2 et:
