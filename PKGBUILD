# Maintainer: Leo <i@setuid0.dev>
# Contributor: Jonas Schürmann <jonasschuermann@aol.de>
# Contributor: condy <condy0919[at]gmail[dot]com>

pkgname=psysh
pkgver=0.10.12
pkgrel=1
pkgdesc="A runtime developer console, interactive debugger and REPL for PHP."
url="https://psysh.org/"
arch=('x86_64')
license=('MIT')
depends=('php')
install=.install
source=(
	"https://github.com/bobthecow/psysh/releases/download/v${pkgver}/psysh-v${pkgver}.tar.gz"
	"LICENSE::https://raw.githubusercontent.com/bobthecow/psysh/v${pkgver}/LICENSE"
)
sha256sums=(
	'509e383e055d5f0fbe81f2998014e33811518f718bd16501ec8d10a5dceb8a3c'
	'SKIP'
)

package() {
	cd "${srcdir}"
	install -Dm755 psysh "${pkgdir}/usr/bin/psysh"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
