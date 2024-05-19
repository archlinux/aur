# Maintainer: zoe <chp321 [at] gmail [dot] com>

pkgname=pdfcropmargins
PkgName=pdfCropMargins
CodeChemin="ad/af/17707613067642f6ca164e9772ac4af3d81647b44778cbf62cb8ba4a0d9a"
pkgver=2.1.2
pkgrel=2
pkgdesc="Automatically crops the margins of PDF files"
url="https://pypi.org/project/pdfCropMargins/"
arch=('any')
license=('GPL')
makedepends=('python-pip')
depends=('python-setuptools' 'python-wheel' 'python-pymupdf' 'python-pypdf2')
optdepends=('ghostscript' 'poppler')
conflicts=('python-pysimplegui')
install=${pkgname}.install
source=("https://files.pythonhosted.org/packages/$CodeChemin/$PkgName-$pkgver-py2.py3-none-any.whl")
md5sums=('d5e3f85db0266045da472bf2069c3582')

package() {
  cd ${srcdir}
  pip install --root="$pkgdir" $PkgName-$pkgver-py2.py3-none-any.whl
}
