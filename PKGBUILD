# Maintainer: Varakh <varakh@varakh.de>
# Ex-Maintainer: Ray Del Rosario <michael@raydelrosario.com>
pkgname='grype-bin'
pkgver=0.69.0
pkgrel=1
pkgdesc='A vulnerability scanner for container images and filesystems.'
url='https://github.com/anchore/grype'
arch=('x86_64')
license=('Apache')
source=("https://github.com/anchore/grype/releases/download/v${pkgver}/grype_${pkgver}_linux_amd64.tar.gz")
sha256sums=('2a602dba318f8509dc993846df720f64c304bed48232ed4d69a2e3eba7c529b1')
package() {
	install -Dm755 "$srcdir/grype" "${pkgdir}/usr/local/bin/grype"	
}
