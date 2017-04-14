# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkfontchooser' 'python2-tkfontchooser')
pkgver=1.0.3
pkgrel=1
pkgdesc="Font chooser dialog for tkinter"
arch=('any')
url="https://pypi.python.org/pypi/tkFontChooser"
license=('GPL3')
source=("tkFontChooser-$pkgver.tar.gz::https://github.com/j4321/tkFontChooser/archive/v$pkgver.tar.gz")
sha512sums=('edd55a80cc5a58036c3b0b6f4ac85ad5c409faf1a3eba55e23175274d2cffc64b9dbb46eb50c5687908d7e02196503931c087299ca71bce9e6333fef04b5129c')

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

