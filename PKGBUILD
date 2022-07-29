# Maintainer: zoe <chp321 [at] gmail [dot] com>

pkgname=pdfcropmargins
PkgName=pdfCropMargins
CodeChemin="24/d9/d9bb0286d9c8e0aa2a752c7bad654f6491daefaab6b1737544ab62caf0db"
pkgver=1.0.9
pkgrel=1
pkgdesc="Automatically crops the margins of PDF files"
url="https://pypi.org/project/pdfCropMargins/"
arch=('any')
license=('GPL')
depends=('python-setuptools' 'python-wheel' 'python-pysimplegui' 'python-pymupdf' 'python-pypdf2' 'ghostscript' 'poppler')
install=${pkgname}.install
source=("https://files.pythonhosted.org/packages/$CodeChemin/$PkgName-$pkgver.tar.gz")
md5sums=('e60e276060faa5ba9316dce475e2fa50')


build() {
  cd $srcdir/$PkgName-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$PkgName-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
