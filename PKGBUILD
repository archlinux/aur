# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>

pkgname=kubeshark-bin
pkgver=41.3
pkgrel=1
pkgdesc="A simple-yet-powerful API traffic viewer for Kubernetes enabling you to view all API communication between microservices to help your debug and troubleshoot regressions."
arch=('x86_64')
conflicts=('mizu-bin')
url="https://github.com/kubeshark/kubeshark"
license=('Apache')
source=("https://github.com/kubeshark/kubeshark/releases/download/${pkgver}/kubeshark_linux_amd64")
sha256sums=('9f93bdd3779c8c809e5614f859c3f7e3c122101322f503b45551762905796526')

package() {
	install -D -m755 kubeshark_linux_amd64 -T "${pkgdir}/usr/bin/kubeshark"
}
