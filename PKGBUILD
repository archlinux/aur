# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=python2-pyacoustid
pkgver=0.4
pkgrel=1
arch=(any)
pkgdesc="bindings for Chromaprint acoustic fingerprinting and the Acoustid API"
url="https://github.com/sampsyo/pyacoustid"
license=('MIT')
depends=('chromaprint')
source=(http://pypi.python.org/packages/source/p/pyacoustid/pyacoustid-$pkgver.tar.gz)
md5sums=('32c7db650a42fdd7588b7d852154911e')

build() {
    cd $srcdir/pyacoustid-$pkgver
    python2 setup.py install --root=$pkgdir
}
