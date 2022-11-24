# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>

pkgname=kubeshark-bin
pkgver=37.0
pkgrel=2
pkgdesc="A simple-yet-powerful API traffic viewer for Kubernetes enabling you to view all API communication between microservices to help your debug and troubleshoot regressions."
arch=('x86_64')
conflicts=('mizu-bin')
url="https://github.com/kubeshark/kubeshark"
license=('Apache')
source=("https://github.com/kubeshark/kubeshark/releases/download/${pkgver}/kubeshark_linux_amd64")
sha256sums=('fb4bf8be97f3be0f67cea9679819f7bfdc66d14bd1683f04affe441d37e29885')

package() {
	install -D -m755 kubeshark_linux_amd64 -T "${pkgdir}/usr/bin/kubeshark"
}
