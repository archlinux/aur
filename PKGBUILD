# Maintainer: Tsiry Sandratraina <tsiry.sndr@fluentci.io>

pkgname=piratebay
pkgver=0.1.9
pkgrel=1
pkgdesc="Search torrents from The Pirate Bay"
arch=('x86_64')
url="https://github.com/tsirysndr/piratebay"
source=("$url/releases/download/v${pkgver/_/-}/piratebay_v${pkgver/_/-}_x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('d9eff29fc3b20a2a82f7a2ae93be3be8f623dd14d86ec836dc8df4dd39cfc2e0')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  bsdtar -xvf "${srcdir}/piratebay_v${pkgver}_x86_64-unknown-linux-gnu.tar.gz" -C "${pkgdir}/usr/bin"
}