# Maintainer: zoe <chp321 [at] gmail [dot] com>

pkgname=pdfcropmargins
PkgName=pdfCropMargins
CodeChemin="7f/f1/cfa4875dd77fb0d0a992c8579264ba75b665393d9a58533bb2231ae9f368"
pkgver=1.0.5
pkgrel=1
pkgdesc="Automatically crops the margins of PDF files"
url="https://pypi.org/project/pdfCropMargins/"
arch=('any')
license=('GPL')
depends=('python-setuptools' 'python-wheel' 'python-pysimplegui' 'python-pymupdf' 'python-pypdf2' 'ghostscript' 'poppler')
install=${pkgname}.install
source=("https://files.pythonhosted.org/packages/$CodeChemin/$PkgName-$pkgver.tar.gz")
md5sums=('4fa2397e4aaefdc6a1ce677d8bf1bc90')


build() {
  cd $srcdir/$PkgName-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$PkgName-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
