# Maintainer: Varakh <varakh@varakh.de>
# Ex-Maintainer: Ray Del Rosario <michael@raydelrosario.com>
pkgname='grype-bin'
pkgver=0.63.0
pkgrel=1
pkgdesc='A vulnerability scanner for container images and filesystems.'
url='https://github.com/anchore/grype'
arch=('x86_64')
license=('Apache')
source=("https://github.com/anchore/grype/releases/download/v${pkgver}/grype_${pkgver}_linux_amd64.tar.gz")
sha256sums=('835b22f547bae314f5334c2ac07ca6fa42e1ed329c3f4e07e724667cba38faf7')
package() {
	install -Dm755 "$srcdir/grype" "${pkgdir}/usr/local/bin/grype"	
}
