# Maintainer : Tony Benoy <me@tonybenoy.com>
# Contributor:: Jean Lucas <jean@4ray.co>

pkgname=python-mail-parser
pkgver=3.15.0
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
sha256sums=('d66638acf0633dfd8a718e1e3646a6d58f8e9d75080c94638c7b267b4b0d6c86')

package() {
  cd mail-parser-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
