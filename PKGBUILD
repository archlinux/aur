# Maintainer: Matthew Wilding <mbwilding at gmail dot com>

pkgname=("ttf-neospleen-nerd-font")
pkgver=1.0.57
pkgrel=1
pkgdesc="A modern monospaced font inspired by Spleen - Nerd Font"
url="https://github.com/mbwilding/NeoSpleen"
license=("BSD-2-Clause")
arch=("any")
source=("https://github.com/mbwilding/NeoSpleen/releases/download/$pkgver/NeoSpleenNerdFont-TTF.zip")
b2sums=('25f2907eb9147b50d2589f6ef822b325ef1c0ea0439b005680f8f0aa587429eacb7c9de459e225b40735d2dd4c1875add7ae5c1337dd6a008be7e780d678af6d')

package() {
  install -d ${pkgdir}/usr/share/fonts/NeoSpleen
  cp *.ttf ${pkgdir}/usr/share/fonts/NeoSpleen
}
