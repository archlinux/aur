# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=renpy-sdk
pkgver=6.99.13
pkgrel=1
pkgdesc="The Ren'Py Visual Novel Engine SDK"
arch=('any')
url='http://www.renpy.org'
license=('custom')
depends=('renpy')
options=('!strip')
source=("http://www.renpy.org/dl/${pkgver}/renpy-${pkgver}-sdk.tar.bz2")
sha256sums=('2563297b79eaee67502ab27d0d88aebd9118b34efb331f389a0aaeb8c1827522')

package() {
  cd renpy-${pkgver}-sdk

  install -dm 755 "${pkgdir}"/usr/share/renpy

  cp -dr --no-preserve='ownership' lib renpy.exe renpy.sh "${pkgdir}"/usr/share/renpy/
}

# vim: ts=2 sw=2 et:
