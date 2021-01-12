# Contributor & Maintainer: Rudy Matela <rudy[dot]matela[at]gmail[dot]com>
pkgname=clitest
pkgver=0.4.0
pkgrel=1
pkgdesc="A program to perform automatic testing of command line programs"
arch=(any)
url="https://github.com/aureliojargas/clitest"
license=('MIT')
depends=(bash)
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aureliojargas/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('963b3f72980d0b99fbb1d6b89e111e05')
sha1sums=('c38b87b7ad98249ccfaedfd4fa2ff0d6327c479a')
sha256sums=('e889fb1fdaae44f0911461cc74849ffefb1fef9b200584e1749b355e4f9a3997')

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 clitest     "${pkgdir}/usr/bin/clitest"
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
