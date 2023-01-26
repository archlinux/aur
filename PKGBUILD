# Maintainer: Leo <i@setuid0.dev>
# Contributor: Jonas Schürmann <jonasschuermann@aol.de>
# Contributor: condy <condy0919[at]gmail[dot]com>

pkgname=psysh
pkgver=0.11.11
pkgrel=1
pkgdesc="A runtime developer console, interactive debugger and REPL for PHP."
url="https://psysh.org/"
arch=('x86_64')
license=('MIT')
depends=('php>=7.0.8')
install=.install
source=(
	"https://github.com/bobthecow/psysh/releases/download/v${pkgver}/psysh-v${pkgver}.tar.gz"
	"LICENSE::https://raw.githubusercontent.com/bobthecow/psysh/v${pkgver}/LICENSE"
)
sha256sums=(
	'd7cd4ce0046b3fde5fc1824714333f269c5ab9661f0e9d38cb05029dc476d71f'
	'SKIP'
)

package() {
	cd "${srcdir}"
	install -Dm755 psysh "${pkgdir}/usr/bin/psysh"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
