# Maintainer: Matthew Wilding <mbwilding at gmail dot com>

pkgname=("ttf-neospleen")
pkgver=1.1.64
pkgrel=1
pkgdesc="A modern monospaced font inspired by Spleen"
url="https://github.com/mbwilding/NeoSpleen"
license=("BSD-2-Clause")
arch=("any")
source=("https://github.com/mbwilding/NeoSpleen/releases/download/$pkgver/NeoSpleen-TTF.zip")
b2sums=('8e17b6b31b2997cfe441ecfe11daf799544d23d89a35468147c5be8569f1415715f4b3e3d828f711734eba65ecd68d1bd8f6547aa40e715d85b8ab49a4e02993')

package() {
  install -d ${pkgdir}/usr/share/fonts/NeoSpleen
  cp *.ttf ${pkgdir}/usr/share/fonts/NeoSpleen
}
