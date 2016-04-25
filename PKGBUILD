# Maintainer:  Ramon <https://github.com/ram-on/imgurbash2>

pkgname=imgurbash2
pkgver=2.1
pkgrel=3
pkgdesc="A small shell script that uploads/deletes images to/from imgur.com"
arch=('any')
url="https://github.com/ram-on/imgurbash2"
license=('MIT')
depends=('curl')
optdepends=('xsel: automatically putting the URL on the X selection for easy pasting'
			'xclip: an alternative to xsel')
source=("https://github.com/ram-on/imgurbash2/archive/${pkgver}.tar.gz")
sha256sums=('80c6859ffc0b49ccb8e3beac0d0ca8412de83b823fef1adf9152e06c21c40ce1')

package() {
	cd "$pkgname-$pkgver"
    install -D -m 755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
