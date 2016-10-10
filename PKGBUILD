# Maintainer: zach <zach {at} zach-adams {dot} com>

pkgname=imgp
_pkgname=imgp
_pkgauthor=jarun
pkgver=2.2
pkgrel=1
pkgdesc="Resize or rotate JPEG and PNG images. Official releases only."
arch=('any')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('GPL3')
depends=('python3' 'python-pillow')
source=("https://github.com/${_pkgauthor}/${_pkgname}/archive/v$pkgver.tar.gz")
conflicts=('imgp-git')
provides=('imgp')
sha256sums=('97daab9c38b6ff2f0026a3256042e7430d42aa4ffb7c0a489bb926a0cacffdcc')

package() {
	make -C "${_pkgname}-$pkgver" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
