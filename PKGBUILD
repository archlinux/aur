# Maintainer: Ray Del Rosario <michael@raydelrosario.com>
pkgname='grype'
pkgver=0.34.7
pkgrel=2
pkgdesc='A vulnerability scanner for container images and filesystems.'
url='https://github.com/anchore/grype'
arch=('x86_64')
license=('Apache')
source=("https://github.com/anchore/grype/releases/download/v${pkgver}/grype_${pkgver}_linux_amd64.tar.gz")
sha256sums=('5b2e495135a1ae11f43817ae49fcc9689fb358bdd2867b19d70ecf6dba1b1012')
package() {
	install -Dm755 "$srcdir/grype" "${pkgdir}/usr/local/bin/${pkgname}"	
}
