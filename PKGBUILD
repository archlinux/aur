# Fernando Jiménez Solano <fjim@sdfeu.org>
# Old Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=python2-pyacoustid
pkgver=0.7
pkgrel=1
arch=(any)
pkgdesc="bindings for Chromaprint acoustic fingerprinting and the Acoustid API"
url="https://github.com/sampsyo/pyacoustid"
license=('MIT')
depends=('chromaprint')
source=(http://pypi.python.org/packages/source/p/pyacoustid/pyacoustid-$pkgver.tar.gz)
md5sums=('dcdead719a61e9d01258ce5061e67ab7')

build() {
    cd $srcdir/pyacoustid-$pkgver
    python2 setup.py install --root=$pkgdir
}
