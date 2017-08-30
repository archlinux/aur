# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkcolorpicker' 'python2-tkcolorpicker' )
pkgver=2.1.2
pkgrel=1
pkgdesc="Color picker dialog for Tkinter, alternative to tkinter.colorchooser."
url="https://github.com/j4321/tkColorPicker"
arch=('any')
license=('GPL3')
source=("tkcolorpicker-$pkgver.tar.gz::https://github.com/j4321/tkColorPicker/archive/v$pkgver.tar.gz")
sha512sums=('093a89217f8e3e8bb0263cd83fd01d15225dcc5b49446f9d9c04fd80bfd393728df421a2e790acb8029d11eadbfcf53c7da27c29383788bb0f9dcdfe39855a1b')

package_python-tkcolorpicker() {
  makedepends=('python-setuptools')
  depends=('python' 'tk')
  cd "${srcdir}/tkColorPicker-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-tkcolorpicker() {
  makedepends=('python2-setuptools')
  depends=('python2' 'tk')
  cd "${srcdir}/tkColorPicker-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
