# Maintainer: Anvar Umarov <arpanetus@protonmail.com>

pkgname="clpimg"
pkgver=master
pkgrel=1
pkgdesc="copy images to clipboard on linux on qt backend"
arch=('any')
license=('GPL')
url="https://github.com/MahouShoujoMivutilde/clpimg/"
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.zip")
depends=('python-pyqt5')

package() {
        cd "$pkgname-${pkgver}"
        make DESTDIR="$pkgdir" install
}
md5sums=('d9c1154faa94bdead7a4428613ba5aa9')
md5sums=('d9c1154faa94bdead7a4428613ba5aa9')
