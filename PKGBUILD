# Maintainer: Alif Rachmawadi <arch@subosito.com>

pkgname=hawkeye
pkgver=0.2.0
pkgrel=1
pkgdesc="A useful app for GitHub Notifications"
arch=('x86_64')
license=('MIT')
url="https://github.com/harksys/HawkEye"
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}-linux-amd64.deb")
sha256sums=('e6accf5b718aa28f40f0fd47d37fa56e4e49d55eea3c6839e63514b5b163311d')

package() {
  bsdtar -xf data.tar.xz -C "${pkgdir}/"

  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/opt/Hawk Eye/hawkeye" "${pkgdir}/usr/bin/hawkeye"
}
