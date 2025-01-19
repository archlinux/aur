# Maintainer: zoe <chp321 [at] gmail [dot] com>

pkgname=pdfcropmargins
PkgName=pdfCropMargins
CodeChemin="ca/35/a10ed48bbec00f46504e4e6e8ef1487bcf02d91560cbce40ebb5f3556746"
pkgver=2.2.0
pkgrel=3
pkgdesc="Automatically crops the margins of PDF files"
url="https://pypi.org/project/pdfCropMargins/"
arch=('any')
license=('GPL')
makedepends=('sudo' 'python-pip')
depends=('python-setuptools' 'python-wheel' 'python-pymupdf' 'python-pypdf')
optdepends=('ghostscript' 'poppler')
conflicts=('python-pysimplegui')
install=${pkgname}.install
source=("https://files.pythonhosted.org/packages/$CodeChemin/$PkgName-$pkgver-py3-none-any.whl")
md5sums=('2f4d97017e95470da2c6aba118568b19')

package() {
  cd ${srcdir}
  sudo pip install --root="$pkgdir" $PkgName-$pkgver-py3-none-any.whl
}
