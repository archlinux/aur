# Maintainer: Varakh <varakh@varakh.de>
# Ex-Maintainer: Ray Del Rosario <michael@raydelrosario.com>
pkgname='grype-bin'
pkgver=0.88.0
pkgrel=1
pkgdesc='A vulnerability scanner for container images and filesystems.'
url='https://github.com/anchore/grype'
arch=('x86_64')
license=('Apache')
source=("https://github.com/anchore/grype/releases/download/v${pkgver}/grype_${pkgver}_linux_amd64.tar.gz")
sha256sums=('7a7e1bf0caf88350eeb7433f41ce6e7b69d1eed57ce67abf24eae62562f38948')
package() {
	install -Dm755 "$srcdir/grype" "${pkgdir}/usr/bin/grype"
}
