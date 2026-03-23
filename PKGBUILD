# Maintainer: Matthew Wilding <mbwilding at gmail dot com>

pkgname=("ttf-neospleen-nerd-font")
pkgver=1.1.63
pkgrel=1
pkgdesc="A modern monospaced font inspired by Spleen - Nerd Font"
url="https://github.com/mbwilding/NeoSpleen"
license=("BSD-2-Clause")
arch=("any")
source=("https://github.com/mbwilding/NeoSpleen/releases/download/$pkgver/NeoSpleenNerdFont-TTF.zip")
b2sums=('2e97b7ea402c4d1b02f53997beda9b72b0b5f281522db9773cec0a3d342e8e01a557126165104772cad55254f972f9723a145c3b97d9cc4230e0db8e11da89ba')

package() {
  install -d ${pkgdir}/usr/share/fonts/NeoSpleen
  cp *.ttf ${pkgdir}/usr/share/fonts/NeoSpleen
}
