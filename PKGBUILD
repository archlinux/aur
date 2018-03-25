# Maintainer: Pablo Arias <pabloariasal@gmail.com>
# Contributor: zach <zach {at} zach-adams {dot} com>
# Contributor: arunj
# Contributor: shaggytwodope

pkgname=imgp
_pkgauthor=jarun
pkgver=2.5
pkgrel=1
pkgdesc="Multi-core batch image resizer and rotator"
arch=('any')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('GPL3')
depends=('python' 'python-pillow')
source=("https://github.com/${_pkgauthor}/${pkgname}/archive/v$pkgver.tar.gz")
conflicts=('imgp-git')
sha256sums=('6f810104f80f23c1c0967e156921b971947e902d6809c5dae2885777c996eae0')

package() {
	make -C "${pkgname}-$pkgver" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
