# Maintainer: M0Rf30
# Contributor: Gour <gour@gour-nitai.com>

pkgname=python2-vatnumber
_pkgname=vatnumber
pkgver=1.2
pkgrel=1
pkgdesc="Python module to validate VAT numbers"
arch=('any')
url="http://code.google.com/p/vatnumber/"
conflicts=('python-vatnumber')
license=('GPL3')
depends=('python2')
makedepends=('python2-setuptools')
optdepends=("python2-suds: SOAP client for European Union's Vat information exchange service")
source=("https://pypi.python.org/packages/d7/7c/869b59cd9cb6ed1057372cb704a3b86688ae8c12cfc7fcaedbc1424f5e7f/$_pkgname-$pkgver.tar.gz")
md5sums=('3b1541be3834a865f6f7bcce809ffb25')
package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
}
