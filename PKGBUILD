# Maintainer: Varakh <varakh@varakh.de>
# Ex-Maintainer: Ray Del Rosario <michael@raydelrosario.com>
pkgname='grype-bin'
pkgver=0.77.1
pkgrel=1
pkgdesc='A vulnerability scanner for container images and filesystems.'
url='https://github.com/anchore/grype'
arch=('x86_64')
license=('Apache')
source=("https://github.com/anchore/grype/releases/download/v${pkgver}/grype_${pkgver}_linux_amd64.tar.gz")
sha256sums=('f290ff316ded64a9e852f7f84fa2ece439f96656a05dde5084a8e7eaf77befa9')
package() {
	install -Dm755 "$srcdir/grype" "${pkgdir}/usr/bin/grype"	
}
