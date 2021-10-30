# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>

pkgname=mizu-bin
pkgver=0.18.0
pkgrel=1
pkgdesc="A simple-yet-powerful API traffic viewer for Kubernetes enabling you to view all API communication between microservices to help your debug and troubleshoot regressions."
arch=('x86_64')
url="https://github.com/up9inc/mizu"
license=('Apache')
source=("https://github.com/up9inc/mizu/releases/download/${pkgver}/mizu_linux_amd64")
sha256sums=('2a2d6398b50d3addd8c7ca08123d27fda298be0567ad83ff7fd0544f356d4c68')

package() {
	install -D -m755 mizu_linux_amd64 -T "${pkgdir}/usr/bin/mizu"
}
