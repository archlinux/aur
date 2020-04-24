# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=joincap-bin
pkgver=0.10.2
pkgrel=1
pkgdesc="Merge multiple pcap files together, gracefully"
arch=('x86_64')
url='https://github.com/assafmo/joincap'
license=('MIT')
provides=("${pkgname%-bin}")
source=("https://github.com/assafmo/joincap/releases/download/v${pkgver}/joincap-linux64-v${pkgver}.zip")
sha256sums=('SKIP')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}-linux64-v${pkgver}" \
   "${pkgdir}/usr/bin/${pkgname%-bin}"
}