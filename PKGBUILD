# Maintainer: Anvar Umarov <arpanetus@protonmail.com>

pkgname="clpimg"
pkgver=master
pkgrel=1
pkgdesc="copy images to clipboard on linux on qt backend"
arch=("x86_64")
license=('GPL')
source=("https://github.com/MahouShoujoMivutilde/clpimg/archive/refs/heads/master.zip")
depends=('python-pyqt5>=5.15')

package() {
        cd "$pkgname-${pkgver}"
        make DESTDIR="$pkgdir" install
}
md5sums=('d9c1154faa94bdead7a4428613ba5aa9')
md5sums=('d9c1154faa94bdead7a4428613ba5aa9')
