# Maintainer: zoe <chp321 [at] gmail [dot] com>

pkgname=pdfcropmargins
PkgName=pdfCropMargins
CodeChemin="ca/09/b0b036f00fdbec15196ab4f85bd8bb81d0daea0bad32d05c74c0317ae46c"
pkgver=2.1.4
pkgrel=1
pkgdesc="Automatically crops the margins of PDF files"
url="https://pypi.org/project/pdfCropMargins/"
arch=('any')
license=('GPL')
makedepends=('python-pip')
depends=('python-setuptools' 'python-wheel' 'python-pymupdf' 'python-pypdf')
optdepends=('ghostscript' 'poppler')
conflicts=('python-pysimplegui')
install=${pkgname}.install
source=("https://files.pythonhosted.org/packages/$CodeChemin/$PkgName-$pkgver-py2.py3-none-any.whl")
md5sums=('10fcc5b24997c59d5906516da008a875')

package() {
  cd ${srcdir}
  pip install --root="$pkgdir" $PkgName-$pkgver-py2.py3-none-any.whl
}
