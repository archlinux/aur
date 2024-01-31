# Contributor & Maintainer: Rudy Matela <rudy[dot]matela[at]gmail[dot]com>
pkgname=clitest
pkgver=0.5.0
pkgrel=1
pkgdesc="A program to perform automatic testing of command line programs"
arch=(any)
url="https://github.com/aureliojargas/clitest"
license=('MIT')
depends=(bash)
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aureliojargas/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('65281d506d54b6c5f3af67f2211bbb14')
sha1sums=('089fb4c114560f41506082993bcd32645f814a39')
sha256sums=('4005de0bc27e4676e418ab1e1e64861272aa74af1212c73a1173760fc449b049')

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 clitest     "${pkgdir}/usr/bin/clitest"
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
