# Contributor & Maintainer: Rudy Matela <rudy[dot]matela[at]gmail[dot]com>
pkgname=clitest
pkgver=0.3.0
pkgrel=1
pkgdesc="A program to perform automatic testing of command line programs"
arch=('i686' 'x86_64')
url="https://github.com/aureliojargas/clitest"
license=('MIT')
depends=()
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aureliojargas/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('c941ad2efdc5b31106e95d7e7f20cfb8')
sha1sums=('df3eec0448321248f1f03d7a91d484ee4ebc602c') 
sha256sums=('23669c1d10ab01ea083f93de6ce24e0f2ae046c5f6fcdeb68020999d76dae056')

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 clitest     "${pkgdir}/usr/bin/clitest"
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
