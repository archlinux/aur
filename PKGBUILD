# Maintainer: zoe <chp321 [at] gmail [dot] com>

pkgname=pdfcropmargins
PkgName=pdfCropMargins
CodeChemin="85/9d/ec327c75f0cfaa6af6b72af5c52f62ed724ee94fffa34d21b2916ba9e4ee"
pkgver=1.0.8
pkgrel=1
pkgdesc="Automatically crops the margins of PDF files"
url="https://pypi.org/project/pdfCropMargins/"
arch=('any')
license=('GPL')
depends=('python-setuptools' 'python-wheel' 'python-pysimplegui' 'python-pymupdf' 'python-pypdf2' 'ghostscript' 'poppler')
install=${pkgname}.install
source=("https://files.pythonhosted.org/packages/$CodeChemin/$PkgName-$pkgver.tar.gz")
md5sums=('ad016c46797a54a887e39c28a3eb564e')


build() {
  cd $srcdir/$PkgName-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$PkgName-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
