# Maintainer: zach <zach {at} zach-adams {dot} com>
# Maintainer: arunj
# Maintainer: shaggytwodope

pkgname=imgp
_pkgauthor=jarun
pkgver=2.4.1
pkgrel=1
pkgdesc="Resize or rotate JPEG and PNG images. Official releases only."
arch=('any')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('GPL3')
depends=('python' 'python-pillow')
source=("https://github.com/${_pkgauthor}/${pkgname}/archive/v$pkgver.tar.gz")
conflicts=('imgp-git')
provides=('imgp')
sha256sums=('5679ba127b4ea74a2ef4caf0749b67392ea02f0fe73bdc828b1cb24b2d191e07')

package() {
	make -C "${pkgname}-$pkgver" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
