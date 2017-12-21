# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-termstyle'
pkgver=0.1.10
pkgrel=1
pkgdesc="Console colouring for Python"
arch=('x86_64')
url="https://pypi.python.org/pypi/python-termstyle"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
provides=('python-termstyle')
conflicts=('python-termstyle')
options=(!emptydirs)
source=("https://pypi.python.org/packages/b3/b0/97086bb087d660cbdb9c0b0dbaa0548ebd9ba9d5e4701bc09b862228110d/${pkgname}-${pkgver}.tar.gz")
md5sums=('1b227cebbeda209029252420af72e5c7')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
