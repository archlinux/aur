# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=pdfgui_tools
pkgname=$_pkgname-bin
pkgver=1.1.0
pkgrel=2
pkgdesc="A user interface tool developed in Qt and Python that integrates with poppler for PDF document management (binary release)"
arch=('any')
url="https://github.com/TheWatcherMultiversal/pdfgui_tools"
license=('GPL3')
depends=('poppler' 'python-pyqt5' 'python-pypdf2')
source=("$url/releases/download/v$pkgver/${_pkgname}_stable-release_${pkgver}_all.tar.gz")
sha256sums=('fcc8cf636786aac0326cd2e45ea55562f35fb29ea05c5a711fe9c94613b5b41b')

package() {
  mv ${_pkgname}_stable-release_${pkgver}_all/usr "$pkgdir"
}
