# Maintainer: Ray Del Rosario <michael@raydelrosario.com>
pkgname='grype-bin'
pkgver=0.39.0
pkgrel=1
pkgdesc='A vulnerability scanner for container images and filesystems.'
url='https://github.com/anchore/grype'
arch=('x86_64')
license=('Apache')
source=("https://github.com/anchore/grype/releases/download/v${pkgver}/grype_${pkgver}_linux_amd64.tar.gz")
sha256sums=('4ef7eade18408b2422c473b35712c50dd2fb6558c895fb3f7a90d262c21c5074')
package() {
	install -Dm755 "$srcdir/grype" "${pkgdir}/usr/local/bin/grype"	
}
