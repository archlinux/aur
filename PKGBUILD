# Maintainer: Matthew Wilding <mbwilding at gmail dot com>

pkgname=("ttf-neospleen")
pkgver=1.0.57
pkgrel=1
pkgdesc="A modern monospaced font inspired by Spleen"
url="https://github.com/mbwilding/NeoSpleen"
license=("BSD-2-Clause")
arch=("any")
source=("https://github.com/mbwilding/NeoSpleen/releases/download/$pkgver/NeoSpleen-TTF.zip")
b2sums=('c7f98123c07be0965a0193f507152671008462c4ec7cadb95ac8ef0ad95625130823ecf658a55bd33b6dee233775b9e12eecd2a51823e80b73b2c4318603456f')

package() {
  install -d ${pkgdir}/usr/share/fonts/NeoSpleen
  cp *.ttf ${pkgdir}/usr/share/fonts/NeoSpleen
}
