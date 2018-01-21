# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=python-syncthing
_name=syncthing
pkgver=2.2.0
pkgrel=1
pkgdesc="Python bindings to the Syncthing REST interface"
arch=('any')
url="https://github.com/blakev/python-syncthing"
license=('GPL')
groups=()
depends=('python' 'python-requests')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('d7faa35e0d27ecd8da74380da981fe9f')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
