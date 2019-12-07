# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python-indexed_gzip
pkgver=0.8.10
pkgrel=1
pkgdesc="Fast random access of gzip files in Python"
url="https://github.com/pauldmccarthy/indexed_gzip"
depends=('python')
license=('zlib')
arch=('x86_64')
source=('https://files.pythonhosted.org/packages/90/c2/d286c11cac7612127331cd085235b8343cc632c290497117cd13aea922f1/indexed_gzip-0.8.10.tar.gz')
md5sums=('ab951f7a9006099f08ef6f543bfb9b64')

build() {
    cd $srcdir/indexed_gzip-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/indexed_gzip-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 
}
