# Maintainer: Leo <i@setuid0.dev>
# Contributor: Jonas Schürmann <jonasschuermann@aol.de>
# Contributor: condy <condy0919[at]gmail[dot]com>

pkgname=psysh
pkgver=0.12.9
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
sha256sums=('67c4f2c1c3fcf32177b0b740f0cf97818e6abc888ab2bfbde8a270b72371d630' SKIP)

package() {
	cd "${srcdir}"
	install -Dm755 psysh "${pkgdir}/usr/bin/psysh"
	install -Dm644 "LICENSE_v${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
