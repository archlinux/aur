# Maintainer: zach <zach {at} zach-adams {dot} com>
# Maintainer: arunj
# Maintainer: shaggytwodope

pkgname=imgp
_pkgauthor=jarun
pkgver=2.3
pkgrel=1
pkgdesc="Resize or rotate JPEG and PNG images. Official releases only."
arch=('any')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('GPL3')
depends=('python3' 'python-pillow')
source=("https://github.com/${_pkgauthor}/${pkgname}/archive/v$pkgver.tar.gz")
conflicts=('imgp-git')
provides=('imgp')
sha256sums=('9143a699fe5058a6e7f0d5f6baf79674b8d6f26fb70c557b4f73470dd063d810')

package() {
	make -C "${pkgname}-$pkgver" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
