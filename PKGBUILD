# Maintainer: Steve Engledow <steve at offend dot me dot uk>
pkgname=shue
pkgver=1.0.0
pkgrel=1
pkgdesc="A command line tool for modifying and converting colour values for use with CSS etc."
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/stilvoid/shue"
license=('GPL-3.0-or-later')
sha256sums_x86_64=('a9d627fa73f8c6ea5fa2142c4a7e28f5a7b2341fef94bd74fd5200d1cb393a6e')
sha256sums_aarch64=('0919eeb477109105358bf83db3a022624a90bdabf9ec3a672c39dc805bbe02eb')
sha256sums_i686=('5e9d6ca1a5bdfdec80f4dd783aecd140964ebb821d00eaf8c3ee3471acf3e5c7')
source_x86_64=("https://github.com/stilvoid/$pkgname/releases/download/v$pkgver/${pkgname}_Linux_x86_64.zip")
source_aarch64=("https://github.com/stilvoid/$pkgname/releases/download/v$pkgver/${pkgname}_Linux_arm64.zip")
source_i686=("https://github.com/stilvoid/$pkgname/releases/download/v$pkgver/${pkgname}_Linux_i386.zip")

package() {
  install -Dm 755 "${srcdir}/shue" "${pkgdir}/usr/bin/shue"
}