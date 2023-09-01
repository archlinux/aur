# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=pdfgui_tools
pkgname=$_pkgname-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="A user interface tool developed in Qt and Python that integrates with poppler for PDF document management (binary release)"
arch=('x86_64')
url="https://github.com/TheWatcherMultiversal/pdfgui_tools"
license=('GPL3')
depends=('poppler' 'python-pyqt5' 'qt5-base')
source=("$url/releases/download/v$pkgver/${_pkgname}_stable-release_${pkgver}_all.tar.gz")
sha256sums=('15438fdbf60cdce9fa3d66bc54e4077569e7ceb9780b81e7a22a61c5b932d6aa')

package() {
  mv ${_pkgname}_stable-release_${pkgver}_all/usr "$pkgdir"
}
