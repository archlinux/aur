# Maintainer: Vincent Pasquier <vincentpasquier@posteo.net>

pkgname_=ics
pkgname=python-${pkgname_}
pkgver=0.3.1
pkgrel=1
pkgdesc='Pythonic and easy iCalendar library'
arch=('any')
url='http://pypi.python.org/pypi/ics/'
license=('Apache')
depends=('python')
makedepends=('python-setuptools')

source=("https://pypi.python.org/packages/e0/b6/6238912420684e3da7c81c13012e28df6f0c2c978c37e5c57838b9987cc7/${pkgname_}-${pkgver}.tar.gz")
sha512sums=('3e08c51f81f333983beca7cfb77e072d55e68b333d59143173a3dad5a7e439476b53583563fb300b25c871d121c4a5cbed898b3073a80e4d4efb7f12010340e8')

package() {
  cd "$pkgname_-${pkgver}"
  python setup.py install --root=${pkgdir} --optimize=1
}

# vim:set ts=2 sw=2 et:
