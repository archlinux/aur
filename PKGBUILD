# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkfontchooser' 'python2-tkfontchooser')
pkgver=2.0.1
pkgrel=1
pkgdesc="Font chooser dialog for tkinter"
arch=('any')
url="https://pypi.python.org/pypi/tkFontChooser"
license=('GPL3')
source=("tkfontchooser-$pkgver.tar.gz::https://github.com/j4321/tkFontChooser/archive/v$pkgver.tar.gz")
sha512sums=('43073f4b7e57bb1b4e4806a9523693147a304d73bf9ef7ddc67e79baf22d8b0f26cdb89e87a07b84e3dec47b73bd5d10f454b228f49913db23bc1da5b0e73617')

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

