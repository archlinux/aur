# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=python-markups
pkgver=0.4
pkgrel=1
_libname=Markups
pkgdesc='Wrapper around various text markups'
url='http://launchpad.net/python-markups'
depends=('python')
optdepends=('python-markdown: markdown support'
            'python-docutils: reST support')
license=('BSD')
arch=('any')
source=(http://pypi.python.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz)

build() {
    cd "$srcdir/$_libname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_libname-$pkgver"
    python setup.py install --root="$pkgdir"
}

sha256sums=('3c33a19200a224b9c320e48557ec29e13dbe8094c6670da2851b75d6657950b8')
