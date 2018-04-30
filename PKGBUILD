# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=renpy-sdk
pkgver=6.99.14.3
pkgrel=1
pkgdesc="The Ren'Py Visual Novel Engine SDK"
arch=('any')
url='http://www.renpy.org'
license=('custom')
depends=('renpy')
options=('!strip')
source=("http://www.renpy.org/dl/${pkgver}/renpy-${pkgver}-sdk.tar.bz2")
sha256sums=('5cbeea134a1907e8a14458248013e37f39f0c2d023c7b68f6ee2bee574f7a381')

package() {
  cd renpy-${pkgver}-sdk

  install -dm 755 "${pkgdir}"/usr/share/renpy

  cp -dr --no-preserve='ownership' lib renpy.exe renpy.sh "${pkgdir}"/usr/share/renpy/
}

# vim: ts=2 sw=2 et:
