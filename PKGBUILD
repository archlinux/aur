# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>

pkgname=mizu-bin
pkgver=0.22.0
pkgrel=1
pkgdesc="A simple-yet-powerful API traffic viewer for Kubernetes enabling you to view all API communication between microservices to help your debug and troubleshoot regressions."
arch=('x86_64')
url="https://github.com/up9inc/mizu"
license=('Apache')
source=("https://github.com/up9inc/mizu/releases/download/${pkgver}/mizu_linux_amd64")
sha256sums=('70e86c8d4bdf2f569827f131454ecd5f7f7526543bc204379be889ae1792205b')

package() {
	install -D -m755 mizu_linux_amd64 -T "${pkgdir}/usr/bin/mizu"
}
