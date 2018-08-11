# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=python-pycscope
_name=pycscope
pkgver=1.2.1
pkgrel=1
pkgdesc="Generates a cscope index of Python source trees"
arch=('any')
url="http://github.com/portante/pycscope"
license=('GPL2')
groups=()
depends=('python')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('89f1e79dbd211d9f8d96881f2e92e1fc')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
