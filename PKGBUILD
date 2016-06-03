# Maintainer: Ruikai Liu <lrk700@gmail.com>
pkgname=python2-pymupdf
_pkgname=PyMuPDF
pkgver=1.9.1
pkgrel=1
pkgdesc="Python bindings for MuPDF"
arch=('any')
url="https://github.com/rk700/PyMuPDF"
license=('GPL3')
depends=('python2' 'libmupdf')
makedepends=('swig')
source=("https://github.com/rk700/PyMuPDF/archive/v1.9.1.zip")
md5sums=("27b8e869b9ca995ca505ebeba5b4557b")

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python2 setup.py install --root=$pkgdir 
}

# vim:set ts=4 sw=4 sts=4 et:
