# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>

pkgname=mizu-bin
pkgver=32.0
pkgrel=1
pkgdesc="A simple-yet-powerful API traffic viewer for Kubernetes enabling you to view all API communication between microservices to help your debug and troubleshoot regressions."
arch=('x86_64')
url="https://github.com/up9inc/mizu"
license=('Apache')
source=("https://github.com/up9inc/mizu/releases/download/${pkgver}/mizu_linux_amd64")
sha256sums=('e917fb021ea04e8a132c659898ace0f1e0ee512b725df45b9606f9f4de0ed338')

package() {
	install -D -m755 mizu_linux_amd64 -T "${pkgdir}/usr/bin/mizu"
}
