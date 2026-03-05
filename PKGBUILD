# Maintainer: Tsiry Sandratraina <tsiry.sndr@fluentci.io>

pkgname=piratebay
pkgver=0.2.1
pkgrel=1
pkgdesc="Search torrents from The Pirate Bay"
arch=('x86_64')
url="https://github.com/tsirysndr/piratebay"
source=("$url/releases/download/v${pkgver/_/-}/piratebay_v${pkgver/_/-}_x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('d06bf3d8e43a570ee7a1a2ea48227b6deda7ae244628954a77ffb8a98ed6aa49')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  bsdtar -xvf "${srcdir}/piratebay_v${pkgver}_x86_64-unknown-linux-gnu.tar.gz" -C "${pkgdir}/usr/bin"
}
