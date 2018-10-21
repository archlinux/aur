# Maintainer: Pablo Arias <pabloariasal@gmail.com>
# Contributor: zach <zach {at} zach-adams {dot} com>
# Contributor: arunj
# Contributor: shaggytwodope

pkgname=imgp
_pkgauthor=jarun
pkgver=2.6
pkgrel=1
pkgdesc="Multi-core batch image resizer and rotator"
arch=('any')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('GPL3')
depends=('python' 'python-pillow')
source=("https://github.com/${_pkgauthor}/${pkgname}/archive/v$pkgver.tar.gz")
conflicts=('imgp-git')
sha256sums=('f79d35b4337269b51f166e80a5e8e39f08f33f7843733d3ed85795bbe1eea799')

package() {
	make -C "${pkgname}-$pkgver" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
