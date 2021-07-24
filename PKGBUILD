# Maintainer: Anvar Umarov <arpanetus@protonmail.com>

pkgname="clpimg"
pkgver=1.0
pkgrel=2
pkgdesc="copy images to clipboard on linux using qt backend"
arch=('any')
license=('GPL')
url="https://github.com/MahouShoujoMivutilde/clpimg/"
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
depends=('python-pyqt5')

provides=("$pkgname")
conflicts=("$pkgname")

package() {
        cd "$pkgname-${pkgver}"
        make PREFIX=/usr DESTDIR="$pkgdir" install
}

md5sums=('91424f6872dbcd7eafe40f27360bcc18')
