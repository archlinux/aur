# Maintainer: Juliette Monsel <j_4321@protonmail.com>
pkgname=('python-tkfontchooser' 'python2-tkfontchooser')
pkgver=1.0.0
pkgrel=2
pkgdesc="Font chooser dialog for tkinter"
arch=('any')
url="https://pypi.python.org/pypi/tkFontChooser"
license=('GPL3')
depends=('python' 'python2' 'tk')
source=('tkFontChooser-1.0.0.tar.gz::https://pypi.python.org/packages/87/c2/8e9463c70c404e3495f516de414d8faf23718dcce1ddd1ebe01d9d65cc4d/tkFontChooser-1.0.0.tar.gz#md5=c5b73a5f55fa26825cb930dac2030255')
sha512sums=('9f24b649aded617121d792c4cbca69260b30c9e3d3dcfdfbde4b440485b24ce8128850875b2fd74852742b413765d706063f5e4ff415c2b4058613d3dc590582')

package_python-tkfontchooser() {
  depends=('python' 'tk')
  cd "${srcdir}/tkFontChooser-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-tkfontchooser() {
  depends=('python2' 'tk')
  cd "${srcdir}/tkFontChooser-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

