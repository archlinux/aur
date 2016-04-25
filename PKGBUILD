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
sha256sums=('6f21ab00d5491cae62fdd3ac0068d344a03d99bd35f688487ae1ec17ff62056f')

package() {
	cd "$pkgname-$pkgver"
    install -D -m 755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
