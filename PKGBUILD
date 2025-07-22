# Maintainer: Adam Chovanec <git@adamchovanec.cz>
# Ex-Maintainer: Varakh <varakh@varakh.de>
# Ex-Maintainer: Ray Del Rosario <michael@raydelrosario.com>
pkgname='grype-bin'
pkgver=0.96.1
pkgrel=1
pkgdesc='A vulnerability scanner for container images and filesystems.'
url='https://github.com/anchore/grype'
arch=('x86_64')
license=('Apache-2.0')
source=("https://github.com/anchore/grype/releases/download/v${pkgver}/grype_${pkgver}_linux_amd64.tar.gz")
sha256sums=('fbbf84220a5a79d84f9a14559c7bac4fb52f0320d62de05fe24e5587cb127289')
package() {
	install -Dm755 "$srcdir/grype" "${pkgdir}/usr/bin/grype"
}
