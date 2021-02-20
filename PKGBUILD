# Contributor: Richard PALO <richard.palo@free.fr>
pkgname=python-proteus
pkgver=5.8.1
pkgrel=1
pkgdesc="Library to access Tryton server as a client"
arch=('any')
url="http://www.tryton.org/"
license=('LGPL3')
makedepends=('python-setuptools')
depends=('python-dateutil')
optdepends=('python-trytond>=5.8: Trytond server')
source=("https://pypi.io/packages/source/p/proteus/proteus-$pkgver.tar.gz")
sha512sums=('dc74ea3592bffc46ad43d546f8876ffaaedb4be2127857e3c1b299d9127e340bba6cd2dcfa4ce40f044087d5333a8c785c56b8fd26ce0a3dfc6258f7e1fd247f')

package() {
  cd "$srcdir/proteus-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
