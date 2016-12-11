# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>
pkgname=python-port-for
pkgver=0.3.1
pkgrel=1
pkgdesc="Utility that helps with local TCP ports managment. It can find an unused TCP localhost port and remember the association."
arch=('any')
url="https://github.com/kmike/port-for/"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=(https://pypi.io/packages/source/p/port-for/port-for-$pkgver.tar.gz)
sha256sums=('b16a84bb29c2954db44c29be38b17c659c9c27e33918dec16b90d375cc596f1c')

package() {
    cd "$srcdir/port-for-$pkgver"

    python setup.py install --root="$pkgdir/" --optimize=1

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=4 et:
