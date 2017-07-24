# Maintainer: zach <zach {at} zach-adams {dot} com>
# Maintainer: arunj
# Maintainer: shaggytwodope

pkgname=imgp
_pkgauthor=jarun
pkgver=2.4
pkgrel=1
pkgdesc="Resize or rotate JPEG and PNG images. Official releases only."
arch=('any')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('GPL3')
depends=('python3' 'python-pillow')
source=("https://github.com/${_pkgauthor}/${pkgname}/archive/v$pkgver.tar.gz")
conflicts=('imgp-git')
provides=('imgp')
sha256sums=('82ef8a0dce5f7a2e64b7d7c8a456f6cfb20ee60350e97e8043361fa96e3efb5e')

package() {
	make -C "${pkgname}-$pkgver" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
