# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=python-mail-parser
pkgver=3.9.3
pkgrel=1
pkgdesc='Tokenizer for raw mails'
arch=(any)
url=https://pypi.python.org/pypi/mail-parser
license=(Apache)
depends=(python-ipaddress
         python-simplejson
         python-six)
makedepends=(python-setuptools)
source=(https://pypi.python.org/packages/source/m/mail-parser/mail-parser-$pkgver.tar.gz)
sha512sums=('14b7e6116bd4941b09e2f53769786adf519ffd5c4c5bee4d6916b8810ba21b1dee60785019d932767460a7b4f0b55abf40a24cdd141365c175372ade720f410c')

package() {
  cd mail-parser-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
