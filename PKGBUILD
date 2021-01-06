# Maintainer: Pablo Arias <pabloariasal@gmail.com>
# Contributor: zach <zach {at} zach-adams {dot} com>
# Contributor: arunj
# Contributor: shaggytwodope

pkgname=imgp
_pkgauthor=jarun
pkgver=2.8
pkgrel=1
pkgdesc="Multi-core batch image resizer and rotator"
arch=('any')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('GPL3')
depends=('python' 'python-pillow')
source=("https://github.com/${_pkgauthor}/${pkgname}/archive/v$pkgver.tar.gz")
conflicts=('imgp-git')
sha256sums=('91494f57a110c4439ae956a8a45762467d8deb4606a92f687efdc3a61e4e7cbd')

package() {
	make -C "${pkgname}-$pkgver" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
