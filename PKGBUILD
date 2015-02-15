# Maintainer: Thomas Weißschuh <thomas t-8ch.de>

pkgname=khal
pkgver=0.4.0
pkgrel=1
pkgdesc='CLI calendar application build around CalDAV'
arch=('any')
url='http://lostpackets.de/khal/'
license=('MIT')
depends=('python2-urwid' 'python2-vdirsyncer' 'python2-tzlocal'
         'python2-docopt' 'python2-configobj')
source=("http://pypi.python.org/packages/source/k/khal/khal-${pkgver}.tar.gz")


build() {
    cd "$srcdir/khal-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/khal-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}

sha256sums=('9762783cfe1343772da7fd5e287ecfbd825f25e29482b3d32834b41837111e84')
