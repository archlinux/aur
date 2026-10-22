# Maintainer: Leo <i@hardrain980.cm>
# Contributor: Jonas Schürmann <jonasschuermann@aol.de>
# Contributor: condy <condy0919[at]gmail[dot]com>

pkgname=psysh
pkgver=0.12.24
pkgrel=1
pkgdesc="A REPL for PHP"
url="https://psysh.org/"
arch=('x86_64')
license=('MIT')
depends=('php>=7.4')
install=.install
source=(
	"https://github.com/bobthecow/psysh/releases/download/v${pkgver}/psysh-v${pkgver}.tar.gz"
	"LICENSE_v${pkgver}::https://raw.githubusercontent.com/bobthecow/psysh/v${pkgver}/LICENSE"
)
sha256sums=('08693e019d30e30a22bb2a911186527d11d6070b2f7a5962be677b9d7ecfc1a1' SKIP)

package() {
	cd "${srcdir}"
	install -Dm755 psysh "${pkgdir}/usr/bin/psysh"
	install -Dm644 "LICENSE_v${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
