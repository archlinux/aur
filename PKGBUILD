# Maintainer: zach <zach {at} zach-adams {dot} com>

pkgname=imgp
_pkgname=imgp
_pkgauthor=jarun
pkgver=2.1
pkgrel=1
pkgdesc="Resize or rotate JPEG and PNG images. Official releases only."
arch=('any')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('GPL3')
depends=('python3' 'python-pillow')
source=("https://github.com/${_pkgauthor}/${_pkgname}/archive/v$pkgver.tar.gz")
conflicts=('imgp-git')
provides=('imgp')
sha256sums=('6749bab82ed07ab6a44f7c7b8e9d5e90ea1a82382f4fa26e27392c7a2b5620ea')

package() {
	make -C "${_pkgname}-$pkgver" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
