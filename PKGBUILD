# Maintainer: Luis Pérez <luis.perez@protonmail.com>
pkgname=gtree-bin
_pkgname=gtree
pkgver=0.2.1
pkgrel=1
pkgdesc="tree command with icons."
arch=(x86_64)
url="https://github.com/kitagry/gtree"
license=('GPL')
makedepends=()
provides=('gtree')
conflicts=('gtree')
source=("https://github.com/kitagry/gtree/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('ed5c081e16803dfc8c07f4d8d688bea215d22f317976424e7f94fb3adc0bf143')

package() {
	install -Dm755 "${srcdir}/gtree" "${pkgdir}/usr/bin/gtree"
}
