# Maintainer: zoe <chp321 [at] gmail [dot] com>

pkgname=pdfcropmargins
PkgName=pdfCropMargins
CodeChemin="cb/f3/1c7759222ccc063003293101db77aea9cfc08b4c4378b6942152b7f5f3ab"
pkgver=0.2.15
pkgrel=1
pkgdesc="Automatically crops the margins of PDF files"
url="https://pypi.org/project/pdfCropMargins/"
arch=('any')
license=('GPL')
depends=('python-setuptools' 'python-wheel' 'python-pysimplegui' 'python-pymupdf' 'python-pypdf2' 'ghostscript' 'poppler')
install=${pkgname}.install
source=("https://files.pythonhosted.org/packages/$CodeChemin/$PkgName-$pkgver.tar.gz")
md5sums=('271ca9a70e73c384d0452cbfeb57d210')


build() {
  cd $srcdir/$PkgName-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$PkgName-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
