# Maintainer: Ramon <https://github.com/ram-on/imgurbash2>

pkgname=imgurbash2
pkgver=2.0
pkgrel=2
pkgdesc="A shell script that uploads/deletes images to/from imgur.com"
arch=('any')
url="https://github.com/ram-on/imgurbash2"
license=('MIT')
depends=('curl')
optdepends=('xsel: automatically putting the URL on the X selection for easy pasting'
			'xclip: an alternative to xsel')
source=("https://github.com/ram-on/imgurbash2/archive/${pkgver}.tar.gz")
sha256sums=('00a1c133472412315a678e0882cbd96165c176402ca506582b046a3d9680fc36')

package() {
	cd "$pkgname-$pkgver"
    install -D -m 755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
