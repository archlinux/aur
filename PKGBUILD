# Maintainer: Anand Pant

pkgname=tabex-bin
pkgver=0.0.41
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
sha256sums=('047d186d0117c3876030d1932f07e824f8e6fd9fca2924fdc2a6a5cc93aeca5b')

package() {
  install -Dm755 "tabex_v${pkgver}_linux_amd64/tabex"     "${pkgdir}/usr/bin/tabex"
}
