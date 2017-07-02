# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkcolorpicker' 'python2-tkcolorpicker' )
pkgver=2.0.0
pkgrel=1
pkgdesc="Color picker dialog for Tkinter, alternative to tkinter.colorchooser."
url="https://github.com/j4321/tkColorPicker"
arch=('any')
license=('GPL3')
source=("tkcolorpicker-$pkgver.tar.gz::https://github.com/j4321/tkColorPicker/archive/v$pkgver.tar.gz")
sha512sums=('0548dca78863dc19a49dcdd4fd935aabf1d19c17e115be7c60c989f9d4c9881d8c1a249051729b369c386d660bba6735169f3c5c830029b81286dc09d809bde6')

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
