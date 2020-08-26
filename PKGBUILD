# Maintainer : Tony Benoy <me@tonybenoy.com>
# Contributor:: Jean Lucas <jean@4ray.co>

pkgname=python-mail-parser
pkgver=3.12.0
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
sha256sums=('e8ff4ac4b27d4a0a87fe69cdaca9a9123f9662b28991b3b838e449a779345214')

package() {
  cd mail-parser-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
