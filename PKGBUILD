# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkfontchooser' 'python2-tkfontchooser')
pkgver=2.0.0
pkgrel=1
pkgdesc="Font chooser dialog for tkinter"
arch=('any')
url="https://pypi.python.org/pypi/tkFontChooser"
license=('GPL3')
source=("tkfontchooser-$pkgver.tar.gz::https://github.com/j4321/tkFontChooser/archive/v$pkgver.tar.gz")
sha512sums=('3d4d6f6a214ef04448118e5e2a803747f6600a31e16400c292bcd34327ea3f44928de5acbec6530e25893d3f7bc6b74d5ee3fc11616d72624c8471dc2f9ab354')

package_python-tkfontchooser() {
  makedepends=('python-setuptools')
  depends=('python' 'tk')
  cd "${srcdir}/tkFontChooser-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-tkfontchooser() {
  makedepends=('python2-setuptools')
  depends=('python2' 'tk')
  cd "${srcdir}/tkFontChooser-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

