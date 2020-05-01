# Maintainer: Pablo Arias <pabloariasal@gmail.com>
# Contributor: zach <zach {at} zach-adams {dot} com>
# Contributor: arunj
# Contributor: shaggytwodope

pkgname=imgp
_pkgauthor=jarun
pkgver=2.7
pkgrel=1
pkgdesc="Multi-core batch image resizer and rotator"
arch=('any')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('GPL3')
depends=('python' 'python-pillow')
source=("https://github.com/${_pkgauthor}/${pkgname}/archive/v$pkgver.tar.gz")
conflicts=('imgp-git')
sha256sums=('362f9fab7eaf4c53438e12f32477329c970bd7348181c243ffa30326e231acf7')

package() {
	make -C "${pkgname}-$pkgver" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
