# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=renpy-sdk
pkgver=6.99.7
pkgrel=1
pkgdesc="The Ren'Py Visual Novel Engine SDK"
arch=('any')
url='http://www.renpy.org'
license=('custom')
depends=('renpy')
options=('!strip')
source=("http://www.renpy.org/dl/${pkgver}/renpy-${pkgver}-sdk.tar.bz2")
sha256sums=('0a56745476901b8abec3d9d13bf9ee501c4cae50c2ffdd98a17d55b1d78893f2')

package() {
  cd renpy-${pkgver}-sdk

  install -dm 755 "${pkgdir}"/usr/share/renpy

  cp -dr --no-preserve='ownership' lib renpy.exe renpy.sh "${pkgdir}"/usr/share/renpy/
}

# vim: ts=2 sw=2 et:
