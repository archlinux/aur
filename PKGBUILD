# Maintainer: Varakh <varakh@varakh.de>
# Ex-Maintainer: Ray Del Rosario <michael@raydelrosario.com>
pkgname='grype-bin'
pkgver=0.62.1
pkgrel=1
pkgdesc='A vulnerability scanner for container images and filesystems.'
url='https://github.com/anchore/grype'
arch=('x86_64')
license=('Apache')
source=("https://github.com/anchore/grype/releases/download/v${pkgver}/grype_${pkgver}_linux_amd64.tar.gz")
sha256sums=('5e46e5791877b8decd84a6fbb8f842a3d8893a38d2eb1c0b615b8447238bfc08')
package() {
	install -Dm755 "$srcdir/grype" "${pkgdir}/usr/local/bin/grype"	
}
