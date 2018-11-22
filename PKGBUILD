# Maintainer Radoslaw Mejer <radmen at radmen dot info>

pkgname=manifold-cli
pkgver=0.15.1
pkgrel=1
pkgdesc="Manages Manifold services and config from the command line"
arch=('x86_64')
url="https://github.com/manifoldco/manifold-cli"
license=('BSD')
source=("${url}/releases/download/v${pkgver}/manifold-cli_${pkgver}_linux_amd64.tar.gz")
sha1sums=("2827c2c37daa93fb3f65e6beca29f650215edd4d")

package() {
	install -D -m755 manifold "${pkgdir}/usr/local/bin/manifold"
}
