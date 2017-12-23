# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-termstyle'
pkgver=0.1.11
pkgrel=1
pkgdesc="Console colouring for Python"
arch=('x86_64')
url="https://pypi.python.org/pypi/termstyle"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/65/53/4dfdfe12b499f375cc78caca9cf146c01e752bab7713de4510d35e3da306/termstyle-${pkgver}.tar.gz")
md5sums=('b6ec81a1c7ebe06f139ce3c294bd3ff8')

package() {
  cd "${srcdir}/termstyle-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
