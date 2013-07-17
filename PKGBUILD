# Fernando Jiménez Solano <fjim@sdfeu.org>
# Old Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=python2-pyacoustid
pkgver=1.0.0
pkgrel=1
arch=(any)
pkgdesc="bindings for Chromaprint acoustic fingerprinting and the Acoustid API"
url="https://github.com/sampsyo/pyacoustid"
license=('MIT')
depends=('chromaprint')
makedepends=('python2-distribute')
source=(http://pypi.python.org/packages/source/p/pyacoustid/pyacoustid-$pkgver.tar.gz)
md5sums=('8c9bb988903b373f78ba4386a75b962f')

build() {
    cd $srcdir/pyacoustid-$pkgver
    python2 setup.py install --root=$pkgdir
}
