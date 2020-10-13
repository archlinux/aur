# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python2-opengl
pkgver=3.1.5
pkgrel=1
pkgdesc='The most common cross platform Python binding to OpenGL and related APIs (for Python 2.7)'
arch=('any')
url="http://pyopengl.sourceforge.net"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/b8/73/31c8177f3d236e9a5424f7267659c70ccea604dab0585bfcd55828397746/PyOpenGL-3.1.5.tar.gz")
sha256sums=('4107ba0d0390da5766a08c242cf0cf3404c377ed293c5f6d701e457c57ba3424')

package() {
  cd "PyOpenGL-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 license.txt "${pkgdir}/usr/share/licenses/python2-opengl/LICENSE"
}
