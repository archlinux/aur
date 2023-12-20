# Maintainer: Leo <i@setuid0.dev>
# Contributor: Jonas Schürmann <jonasschuermann@aol.de>
# Contributor: condy <condy0919[at]gmail[dot]com>

pkgname=psysh
pkgver=0.12.0
pkgrel=2
pkgdesc="A runtime developer console, interactive debugger and REPL for PHP."
url="https://psysh.org/"
arch=('x86_64')
license=('MIT')
depends=('php>=7.4')
install=.install
source=(
	"https://github.com/bobthecow/psysh/releases/download/v${pkgver}/psysh-v${pkgver}.tar.gz"
	"LICENSE_v${pkgver}::https://raw.githubusercontent.com/bobthecow/psysh/v${pkgver}/LICENSE"
)
sha256sums=(
	'7691cac4c2828bc57951b9893c3386df925070cba26e9903430a4939f26a69b2'
	'SKIP'
)

package() {
	cd "${srcdir}"
	install -Dm755 psysh "${pkgdir}/usr/bin/psysh"
	install -Dm644 "LICENSE_v${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
