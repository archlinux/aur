# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=python-opengl-accelerate
pkgver=3.1.3b1 # We have to use the beta version for now, as 3.1.0 does not support Python 3.7
pkgrel=1
pkgdesc=""
_name=PyOpenGL-accelerate
arch=('any')
url=""
license=('BSD')
groups=()
depends=('python' 'python-opengl')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('e687eea7e006d65f531933b49b3b3d2feaaf51279147a904247f9d189762a36f')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
