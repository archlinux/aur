# Maintainer: Matthew Wilding <mbwilding at gmail dot com>

pkgname=("ttf-neospleen")
pkgver=1.1.63
pkgrel=1
pkgdesc="A modern monospaced font inspired by Spleen"
url="https://github.com/mbwilding/NeoSpleen"
license=("BSD-2-Clause")
arch=("any")
source=("https://github.com/mbwilding/NeoSpleen/releases/download/$pkgver/NeoSpleen-TTF.zip")
b2sums=('ffa4b163c7f7c8deef6a66f58673e114ed048b71ef6a6f16b6911779f5dae46a0dbd5bb956c10ccb75e57694a6341616aa20159ca012d9a320be74d1c6101e9f')

package() {
  install -d ${pkgdir}/usr/share/fonts/NeoSpleen
  cp *.ttf ${pkgdir}/usr/share/fonts/NeoSpleen
}
