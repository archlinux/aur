# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=renpy-sdk
pkgver=6.99.12.3
pkgrel=1
pkgdesc="The Ren'Py Visual Novel Engine SDK"
arch=('any')
url='http://www.renpy.org'
license=('custom')
depends=('renpy')
options=('!strip')
source=("http://www.renpy.org/dl/${pkgver}/renpy-${pkgver}-sdk.tar.bz2")
sha256sums=('dddc7120b6420e5fa8040882ffff5e83c645b26946cfa253986a40868bd6d39b')

package() {
  cd renpy-${pkgver}-sdk

  install -dm 755 "${pkgdir}"/usr/share/renpy

  cp -dr --no-preserve='ownership' lib renpy.exe renpy.sh "${pkgdir}"/usr/share/renpy/
}

# vim: ts=2 sw=2 et:
