# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgbase=python-markups
pkgname=(python-markups python2-markups)
pkgver=0.4
pkgrel=1
_libname=Markups
pkgdesc='Wrapper around various text markups'
url='http://launchpad.net/python-markups'
depends=('python')
makedepends=('python-setuptools' 'python2-setuptools')
license=('BSD')
arch=('any')
source=(http://pypi.python.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz)

package_python-markups() {
    depends=('python')
    optdepends=('python-markdown: markdown support'
                'python-docutils: reST support')

    cd "$srcdir/$_libname-$pkgver"
    python setup.py install --root="$pkgdir"
}

package_python2-markups() {
    depends=('python2')
    optdepends=('python-markdown2: markdown support'
                'python-docutils2: reST support')

    cd "$srcdir/$_libname-$pkgver"
    python2 setup.py install --root="$pkgdir"
}

sha256sums=('3c33a19200a224b9c320e48557ec29e13dbe8094c6670da2851b75d6657950b8')
