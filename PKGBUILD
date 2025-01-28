# Maintainer: Steve Engledow <steve at offend dot me dot uk>
pkgname=retro-sort
pkgver=0.1.3
pkgrel=1
pkgdesc="A command line tool that sorts your files into a folder structure suitable for use with retro hardware"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/stilvoid/retro-sort"
license=('GPL-3.0-or-later')
sha256sums_x86_64=('f603789890a93f9747571c6ed8a3e0abb110eb1b049e3b739e3981743e671e33')
sha256sums_aarch64=('9f77366b98066a87663b96255ef5d14b9631c89e43609d5715419fa5b1c638df')
sha256sums_i686=('a93dea8ad1a7cae0ace9e1e173bec3be5bd0affc1843b2f33f30cc9516c1cc31')
source_x86_64=("https://github.com/stilvoid/$pkgname/releases/download/v$pkgver/${pkgname}_Linux_x86_64.zip")
source_aarch64=("https://github.com/stilvoid/$pkgname/releases/download/v$pkgver/${pkgname}_Linux_arm64.zip")
source_i686=("https://github.com/stilvoid/$pkgname/releases/download/v$pkgver/${pkgname}_Linux_i386.zip")

package() {
  install -Dm 755 "${srcdir}/retro-sort" "${pkgdir}/usr/bin/retro-sort"
}
