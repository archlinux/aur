# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=python-opengl-accelerate
pkgver=3.1.0
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
sha256sums=('927f4670b893d46e2f6273ae938bf0a1db27ffae3336eba94813ccef6260c410')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
