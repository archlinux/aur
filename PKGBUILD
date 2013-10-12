# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=python-markups
pkgver=0.2.4
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

sha256sums=('0aab138698035e699fad1c88bebb3fa5e90a1876bc7d8fefb3491513fe13f16b')
