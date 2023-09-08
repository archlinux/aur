# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=pdfgui_tools
pkgname=$_pkgname-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="A user interface tool developed in Qt and Python that integrates with poppler for PDF document management (binary release)"
arch=('x86_64')
url="https://github.com/TheWatcherMultiversal/pdfgui_tools"
license=('GPL3')
depends=('poppler' 'python-pyqt5')
source=("$url/releases/download/v$pkgver/${_pkgname}_stable-release_${pkgver}_all.tar.gz")
sha256sums=('e0ccab1b5676d4f61bbab5955ee8f0a861a910afebb321443f9c08c6b9e4f66a')

package() {
  mv ${_pkgname}_stable-release_${pkgver}_all/usr "$pkgdir"
}
