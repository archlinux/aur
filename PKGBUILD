# Maintainer: Varakh <varakh@varakh.de>
# Ex-Maintainer: Ray Del Rosario <michael@raydelrosario.com>
pkgname='grype-bin'
pkgver=0.89.0
pkgrel=1
pkgdesc='A vulnerability scanner for container images and filesystems.'
url='https://github.com/anchore/grype'
arch=('x86_64')
license=('Apache')
source=("https://github.com/anchore/grype/releases/download/v${pkgver}/grype_${pkgver}_linux_amd64.tar.gz")
sha256sums=('3dbbf5c4f3c28dfc9f9e070a937dc680170ee83a873b946e59bb58c71b8a3ae5')
package() {
	install -Dm755 "$srcdir/grype" "${pkgdir}/usr/bin/grype"
}
