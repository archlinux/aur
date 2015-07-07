# Maintainer: Olivier Biesmans <o.aurlinux@biesmans.fr>

pkgname=python-tellcore-py
pkgver=0.1.0
pkgrel=1
pkgdesc="Python wrapper for Telldus' home automation library."
arch=('any')
url="https://pypi.python.org/pypi/tellcore-py"
license=('GPL3')
groups=('devel')
depends=('python')
makedepends=('python')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/t/${pkgname#python-}/${pkgname#python-}-${pkgver}.tar.gz")
md5sums=('5f4f8104647dd4127f60a2d9704d588a')

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
