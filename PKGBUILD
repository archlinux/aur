# Maintainer: Varakh <varakh@varakh.de>
# Ex-Maintainer: Ray Del Rosario <michael@raydelrosario.com>
pkgname='grype-bin'
pkgver=0.84.0
pkgrel=1
pkgdesc='A vulnerability scanner for container images and filesystems.'
url='https://github.com/anchore/grype'
arch=('x86_64')
license=('Apache')
source=("https://github.com/anchore/grype/releases/download/v${pkgver}/grype_${pkgver}_linux_amd64.tar.gz")
sha256sums=('f2322ca8599ddcd5bc75679a584f04e1a6b48f50ff4318989c39a241be1616e4')
package() {
	install -Dm755 "$srcdir/grype" "${pkgdir}/usr/bin/grype"	
}
