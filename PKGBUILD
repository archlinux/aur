# Maintainer: Leo <i@hardrain980.cm>
# Contributor: Jonas Schürmann <jonasschuermann@aol.de>
# Contributor: condy <condy0919[at]gmail[dot]com>

pkgname=psysh
pkgver=0.12.12
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
sha256sums=('a8342dbf7508eec69b3dca78a8a2703fc22c3818e11581dba177a445d414802e' SKIP)

package() {
	cd "${srcdir}"
	install -Dm755 psysh "${pkgdir}/usr/bin/psysh"
	install -Dm644 "LICENSE_v${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
