# Maintainer: Varakh <varakh@varakh.de>
# Ex-Maintainer: Ray Del Rosario <michael@raydelrosario.com>
pkgname='grype-bin'
pkgver=0.81.0
pkgrel=1
pkgdesc='A vulnerability scanner for container images and filesystems.'
url='https://github.com/anchore/grype'
arch=('x86_64')
license=('Apache')
source=("https://github.com/anchore/grype/releases/download/v${pkgver}/grype_${pkgver}_linux_amd64.tar.gz")
sha256sums=('07c26f84ad8ce782ba2aa769a595b34befbb4f3bc6dff0da6095f2faee3585e2')
package() {
	install -Dm755 "$srcdir/grype" "${pkgdir}/usr/bin/grype"	
}
