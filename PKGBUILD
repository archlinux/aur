# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>

pkgname=mizu-bin
pkgver=36.0
pkgrel=1
pkgdesc="A simple-yet-powerful API traffic viewer for Kubernetes enabling you to view all API communication between microservices to help your debug and troubleshoot regressions."
arch=('x86_64')
url="https://github.com/up9inc/mizu"
license=('Apache')
source=("https://github.com/up9inc/mizu/releases/download/${pkgver}/mizu_linux_amd64")
sha256sums=('442989c7c635f7a90396e06a7a1139e28b5b649cc9c82b44fede148f1ff225c1')

package() {
	install -D -m755 mizu_linux_amd64 -T "${pkgdir}/usr/bin/mizu"
}
