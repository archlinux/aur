# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-curses-menu'
pkgver=0.5.0
pkgrel=1
pkgdesc="A simple console menu system using curses in Python"
arch=('x86_64')
url="https://pypi.python.org/pypi/curses-menu"
license=('MIT')
depends=('python')
checkdepends=('python-tox')
makedepends=('python-pytest-runner' 'python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/3b/7d/82f1492afd33f92e64d44d51f65eff4c39382642cfced65d5748a770bb8f/curses-menu-${pkgver}.zip")
md5sums=('2415e53e7834dba1c97ac1e3839e45eb')

package() {
  cd "${srcdir}/curses-menu-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
