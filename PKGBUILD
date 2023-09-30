# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=pdfgui_tools
pkgname=$_pkgname-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="A user interface tool developed in Qt and Python that integrates with poppler for PDF document management (binary release)"
arch=('x86_64')
url="https://github.com/TheWatcherMultiversal/pdfgui_tools"
license=('GPL3')
depends=('poppler' 'python-pyqt5')
source=("$url/releases/download/v$pkgver/${_pkgname}_stable-release_${pkgver}_all.tar.gz")
sha256sums=('17d2259a99731665ff72e05e6edb8afe1dde944662651c8ac59584247131dd74')

package() {
  mv ${_pkgname}_stable-release_${pkgver}_all/usr "$pkgdir"
}
