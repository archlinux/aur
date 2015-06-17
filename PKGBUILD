# Maintainer: juantascon <juantascon.aur@horlux.org>

pkgname=tvcmd
pkgver=1.1.3.1
pkgrel=2
pkgdesc="Command line tool to keep track of tv shows episodes"
arch=('any')
url="http://tvcmd.horlux.org"
license="GPL3"
depends=('python' 'python-httplib2' 'python-xdg')
source=("https://github.com/juantascon/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('3923120c0f8e9b676f4c6ce0fa1725c1b46c1b01a157d583372f596b5185336b')

package() {
    cd $srcdir/$pkgname-$pkgver/
    python setup.py install --root $pkgdir
}
