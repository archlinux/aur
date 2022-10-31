# Maintainer: Varakh <varakh@varakh.de>
# Ex-Maintainer: Ray Del Rosario <michael@raydelrosario.com>
pkgname='grype-bin'
pkgver=0.51.0
pkgrel=1
pkgdesc='A vulnerability scanner for container images and filesystems.'
url='https://github.com/anchore/grype'
arch=('x86_64')
license=('Apache')
source=("https://github.com/anchore/grype/releases/download/v${pkgver}/grype_${pkgver}_linux_amd64.tar.gz")
sha256sums=('5f9e8f3ddb914a0252c945468b986236ba9b50a5bd89d8a7d3adfdc1a2ca6834')
package() {
	install -Dm755 "$srcdir/grype" "${pkgdir}/usr/local/bin/grype"	
}
