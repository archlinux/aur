# Maintainer: Tsiry Sandratraina <tsiry.sndr@fluentci.io>

pkgname=piratebay
pkgver=0.3.0
pkgrel=1
pkgdesc="Search and download torrents from The Pirate Bay"
arch=('x86_64')
url="https://github.com/tsirysndr/piratebay"
source=("$url/releases/download/v${pkgver/_/-}/piratebay_v${pkgver/_/-}_x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('12330a444bce1b4d23fded131de4939ac446887f5b72d548f93859fc2e1834df')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  bsdtar -xvf "${srcdir}/piratebay_v${pkgver}_x86_64-unknown-linux-gnu.tar.gz" -C "${pkgdir}/usr/bin"
}
