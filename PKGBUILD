# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=pdfgui_tools
pkgname=$_pkgname-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="A user interface tool developed in Qt and Python that integrates with poppler for PDF document management (binary release)"
arch=('any')
url="https://github.com/TheWatcherMultiversal/pdfgui_tools"
license=('GPL3')
depends=('poppler' 'pyside6' 'python-pymupdf' 'python-pypdf2')
source=("$url/releases/download/v$pkgver/${_pkgname}_stable-release_${pkgver}_all.tar.gz")
sha256sums=('fee65b1f6baaf205b2efb65347f0cc7e54963f6ddd3b7fddd3e7e44225451c4a')

package() {
  mv ${_pkgname}_stable-release_${pkgver}_all/usr "$pkgdir"
}
