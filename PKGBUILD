# Maintainer:  Ramon <https://github.com/ram-on/imgurbash2>

pkgname=imgurbash2
pkgver=3.1
pkgrel=5
pkgdesc="A small shell script that uploads/deletes images to/from imgur.com"
arch=('any')
url="https://github.com/ram-on/imgurbash2"
license=('MIT')
depends=('curl')
optdepends=('xsel: automatically putting the URL on the X selection for easy pasting'
			'xclip: an alternative to xsel')
source=("https://github.com/ram-on/imgurbash2/archive/${pkgver}.tar.gz")
sha256sums=('e66e27b96d303a7896d2b4c8abc4dca4974193eebb3851e4ee0b88076b703809')

package() {
	cd "$pkgname-$pkgver"
	install -D -m 755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
	install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
