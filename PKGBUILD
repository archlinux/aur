# Maintainer: zach <zach {at} zach-adams {dot} com>

pkgname=imgd
_pkgname=imgd
_pkgauthor=jarun
pkgver=1.0
pkgrel=1
pkgdesc="Resize or rotate JPEG and PNG images. Official releases only."
arch=('any')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('GPL3')
depends=('python3' 'python-pillow')
source=("https://github.com/${_pkgauthor}/${_pkgname}/archive/v$pkgver.tar.gz")
conflicts=('imgd-git')
provides=('imgd')
sha256sums=('72db55b3ea1c79caf8993854317cb10f578888b1074f20ddad722a34c0565a98')

package() {
	make -C "${_pkgname}-$pkgver" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
