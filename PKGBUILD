# Maintainer: zach <zach {at} zach-adams {dot} com>

pkgname=imgd
_pkgname=imgd
_pkgauthor=jarun
pkgver=2.0
pkgrel=1
pkgdesc="Resize or rotate JPEG and PNG images. Official releases only."
arch=('any')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('GPL3')
depends=('python3' 'python-pillow')
source=("https://github.com/${_pkgauthor}/${_pkgname}/archive/v$pkgver.tar.gz")
conflicts=('imgd-git')
provides=('imgd')
sha256sums=('9897e3f1c36b7fb2a0d2196e15730bd87b9aececd3001d5e57abc49ec6807c18')

package() {
	make -C "${_pkgname}-$pkgver" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
