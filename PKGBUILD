# Maintainer: Anand Pant

pkgname=tabex-bin
pkgver=0.0.42
pkgrel=1
pkgdesc="Tabex CLI for browser session, capture, and page inspection"
arch=('x86_64')
url="https://tabex.dev"
license=('LicenseRef-proprietary')
install="${pkgname}.install"
provides=('tabex')
conflicts=('tabex')

_asset="tabex_v${pkgver}_linux_amd64.tar.gz"
source=("https://github.com/shpitdev/pkgbuilds/releases/download/tabex-v${pkgver}/${_asset}")
sha256sums=('bf230fe7c809e388f5ac8066e29fcf5efb41b869dec4b45ec0ab29c70e37fbbe')

package() {
  install -Dm755 "tabex_v${pkgver}_linux_amd64/tabex"     "${pkgdir}/usr/bin/tabex"
}
