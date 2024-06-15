# Maintainer: Varakh <varakh@varakh.de>
# Ex-Maintainer: Ray Del Rosario <michael@raydelrosario.com>
pkgname='grype-bin'
pkgver=0.79.0
pkgrel=1
pkgdesc='A vulnerability scanner for container images and filesystems.'
url='https://github.com/anchore/grype'
arch=('x86_64')
license=('Apache')
source=("https://github.com/anchore/grype/releases/download/v${pkgver}/grype_${pkgver}_linux_amd64.tar.gz")
sha256sums=('9c11d2d4dcf3cd301f2aab144318d2df2ba0cb745bfd2fb183614ef7c786e605')
package() {
	install -Dm755 "$srcdir/grype" "${pkgdir}/usr/bin/grype"	
}
