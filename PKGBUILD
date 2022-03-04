# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python2-opengl
pkgver=3.1.6
pkgrel=1
pkgdesc='The most common cross platform Python binding to OpenGL and related APIs (for Python 2.7)'
arch=('any')
url="http://pyopengl.sourceforge.net"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/5b/01/f8fd986bc7f456f1a925ee0239f0391838ade92cdb6e5b674ffb8b86cfd6/PyOpenGL-3.1.6.tar.gz")
sha512sums=('b6f2f083df0fd7cf8f8a1077f42fa388bce94c0edde00ed6492104af8306c9925b74649cd2c222be4205b0892e7975de2f7591d0f0bcd9540eb53c0de95fec00')

package() {
  cd "PyOpenGL-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 license.txt "${pkgdir}/usr/share/licenses/python2-opengl/LICENSE"
}
