# Maintainer: Ray Del Rosario <michael@raydelrosario.com>
pkgname='grype'
pkgver=0.36.0
pkgrel=1
pkgdesc='A vulnerability scanner for container images and filesystems.'
url='https://github.com/anchore/grype'
arch=('x86_64')
license=('Apache')
source=("https://github.com/anchore/grype/releases/download/v${pkgver}/grype_${pkgver}_linux_amd64.tar.gz")
sha256sums=('fdff25043ad2ff5b142a28f418b504ef0f0f2fa2cabb8e71061179be08ad7a81')
package() {
	install -Dm755 "$srcdir/grype" "${pkgdir}/usr/local/bin/${pkgname}"	
}
