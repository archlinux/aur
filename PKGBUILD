# Maintainer: Tsiry Sandratraina <tsiry.sndr@fluentci.io>

pkgname=piratebay
pkgver=0.4.0
pkgrel=1
pkgdesc="Search and download torrents from The Pirate Bay"
arch=('x86_64')
url="https://github.com/tsirysndr/piratebay"
source=("$url/releases/download/v${pkgver/_/-}/piratebay_v${pkgver/_/-}_x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('81a0dda1c001317ac1dc31376fff6b3e8b661825e278cbfa6cbaac70e92ba9bb')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  bsdtar -xvf "${srcdir}/piratebay_v${pkgver}_x86_64-unknown-linux-gnu.tar.gz" -C "${pkgdir}/usr/bin"
}
