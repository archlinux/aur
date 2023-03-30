# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>

pkgname=kubeshark-bin
pkgver=39.5
pkgrel=1
pkgdesc="A simple-yet-powerful API traffic viewer for Kubernetes enabling you to view all API communication between microservices to help your debug and troubleshoot regressions."
arch=('x86_64')
conflicts=('mizu-bin')
url="https://github.com/kubeshark/kubeshark"
license=('Apache')
source=("https://github.com/kubeshark/kubeshark/releases/download/${pkgver}/kubeshark_linux_amd64")
sha256sums=('2580796f2d433007f557fafca0b720a8959e2eab15929f80508ecc5e435f5ce0')

package() {
	install -D -m755 kubeshark_linux_amd64 -T "${pkgdir}/usr/bin/kubeshark"
}
