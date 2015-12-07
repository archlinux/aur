# Maintainer: Ruikai Liu <lrk700@gmail.com>
pkgname=python2-pymupdf
_pkgname=PyMuPDF
pkgver=1.8
pkgrel=1
pkgdesc="Python bindings for MuPDF"
arch=('any')
url="https://pypi.python.org/pypi/PyMuPDF/1.8.0"
license=('GPL3')
depends=('python2' 'mupdf')
makedepends=('swig')
source=("https://github.com/rk700/PyMuPDF/archive/v1.8.zip")
md5sums=("8d096d6deb17c0552345d0d7f4da5d62")

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python2 setup.py install --root=$pkgdir 
}

# vim:set ts=4 sw=4 sts=4 et:
