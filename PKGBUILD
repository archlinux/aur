# Maintainer: M0Rf30
# Contributor: Gour <gour@gour-nitai.com>

pkgname=python2-vatnumber
_pkgname=vatnumber
pkgver=1.1
pkgrel=2
pkgdesc="Python module to validate VAT numbers"
arch=('any')
url="http://code.google.com/p/vatnumber/"
conflicts=('python-vatnumber')
license=('GPL3')
depends=('python2')
makedepends=('setuptools')
optdepends=("python2-suds: SOAP client for European Union's Vat information exchange service")
source=("http://vatnumber.googlecode.com/files/$_pkgname-$pkgver.tar.gz")

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}

md5sums=('7b57a0e7e3debbbfdf8c4d8472e8e947')
