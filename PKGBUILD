# Maintainer:  Ramon <https://github.com/ram-on/imgurbash2>

pkgname=imgurbash2
pkgver=3.0
pkgrel=4
pkgdesc="A small shell script that uploads/deletes images to/from imgur.com"
arch=('any')
url="https://github.com/ram-on/imgurbash2"
license=('MIT')
depends=('curl')
optdepends=('xsel: automatically putting the URL on the X selection for easy pasting'
			'xclip: an alternative to xsel')
source=("https://github.com/ram-on/imgurbash2/archive/${pkgver}.tar.gz")
sha256sums=('363fbf6e5179dded7504fdc3cc9311e4c9e3e9a91c979fbddba3e4dabd33f6c9')

package() {
	cd "$pkgname-$pkgver"
    install -D -m 755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
