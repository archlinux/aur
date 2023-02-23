# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>

pkgname=kubeshark-bin
pkgver=38.5
pkgrel=1
pkgdesc="A simple-yet-powerful API traffic viewer for Kubernetes enabling you to view all API communication between microservices to help your debug and troubleshoot regressions."
arch=('x86_64')
conflicts=('mizu-bin')
url="https://github.com/kubeshark/kubeshark"
license=('Apache')
source=("https://github.com/kubeshark/kubeshark/releases/download/${pkgver}/kubeshark_linux_amd64")
sha256sums=('a57785f64ac8353679bb9494d55f1673476d301f2688660df91761468cf0f50e')

package() {
	install -D -m755 kubeshark_linux_amd64 -T "${pkgdir}/usr/bin/kubeshark"
}
