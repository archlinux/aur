# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=python-syncthing
_name=syncthing
pkgver=2.1.2
pkgrel=1
pkgdesc="Python bindings to the Syncthing REST interface"
arch=('any')
url="https://github.com/blakev/python-syncthing"
license=('GPL')
groups=()
depends=('python' 'python-requests' 'python-six' 'python-wheel')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('39f844422a8fa4ba8d2a94d9009cae36')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
