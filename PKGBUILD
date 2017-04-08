# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkfontchooser' 'python2-tkfontchooser')
pkgver=1.0.2
pkgrel=1
pkgdesc="Font chooser dialog for tkinter"
arch=('any')
url="https://pypi.python.org/pypi/tkFontChooser"
license=('GPL3')
source=("tkFontChooser-$pkgver.tar.gz::https://github.com/j4321/tkFontChooser/archive/v$pkgver.tar.gz")
sha512sums=('4db39d0f54cf20c05cd85f707efc3af675087bf7f84e2c1434c2604ccb91576c1f8a470d1054cda1a3f892ef0d8ef85dfdbaf75028f25a9849e5565405810985')

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

