# Maintainer: Varakh <varakh@varakh.de>
# Ex-Maintainer: Ray Del Rosario <michael@raydelrosario.com>
pkgname='grype-bin'
pkgver=0.74.1
pkgrel=1
pkgdesc='A vulnerability scanner for container images and filesystems.'
url='https://github.com/anchore/grype'
arch=('x86_64')
license=('Apache')
source=("https://github.com/anchore/grype/releases/download/v${pkgver}/grype_${pkgver}_linux_amd64.tar.gz")
sha256sums=('03b3728491b4237ac540a9e9b4cfe230efe2a052faa23547b93911614cb5b99c')
package() {
	install -Dm755 "$srcdir/grype" "${pkgdir}/usr/bin/grype"	
}
