# Maintainer: Paul Irofti <paul@irofti.net>
_name=custom_inherit
pkgname="python-$_name"
pkgver=2.3.1
pkgrel=1
pkgdesc="convenient, light-weight tools for inheriting docstrings"
arch=('any')
url="https://github.com/rsokl/custom_inherit"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
#source=("https://files.pythonhosted.org/packages/source/g/${_name}/${_name}-${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/16/23/ee724fb521a5bd53260006028825698f52992e5d5e9f36ef1327d0d10179/custom_inherit-2.3.1.tar.gz")
sha256sums=('a0d104847b4cc1ae24e00061fc2e11da8766b019bf4c8c753822347366c8c49f')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
