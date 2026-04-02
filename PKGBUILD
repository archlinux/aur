# Maintainer: Leo <i@hardrain980.cm>
# Contributor: Jonas Schürmann <jonasschuermann@aol.de>
# Contributor: condy <condy0919[at]gmail[dot]com>

pkgname=psysh
pkgver=0.12.22
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
sha256sums=('d990dadada3badaf3a5fbed3fc1275e2c39519bc62f2c5b3287d12e88130583a' SKIP)

package() {
	cd "${srcdir}"
	install -Dm755 psysh "${pkgdir}/usr/bin/psysh"
	install -Dm644 "LICENSE_v${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
