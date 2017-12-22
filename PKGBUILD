# Maintainer: hexchain <i at hexchain dot org>

pkgname=python2-opengl-accelerate
pkgver=3.1.0
pkgrel=1
pkgdesc="Acceleration code for PyOpenGL"
_name=PyOpenGL-accelerate
arch=('x86_64')
url="http://pyopengl.sourceforge.net/"
license=('BSD')
depends=('python2-opengl')
makedepends=('cython2')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('927f4670b893d46e2f6273ae938bf0a1db27ffae3336eba94813ccef6260c410')

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
