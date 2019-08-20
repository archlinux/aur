# Maintainer Radoslaw Mejer <radmen at radmen dot info>

pkgname=manifold-cli-bin
pkgver=0.15.1
pkgrel=2
pkgdesc="Manages Manifold services and config from the command line"
arch=('x86_64')
url="https://github.com/manifoldco/manifold-cli"
license=('BSD')
conflicts=('manifold-cli')
source=("${url}/releases/download/v${pkgver}/manifold-cli_${pkgver}_linux_amd64.tar.gz")
sha256sums=("5dd34e1064fd3cde1888a397ee9de2315eaf8bb6a406039983fd1f26f6684aa6")

package() {
	install -D -m755 manifold "${pkgdir}/usr/local/bin/manifold"
}
