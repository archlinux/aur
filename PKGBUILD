# Maintainer: zoe <chp321 [at] gmail [dot] com>

pkgname=pdfcropmargins
PkgName=pdfCropMargins
CodeChemin="92/ec/e5869bafd3d41243f7f9ed047fb073f9be1ca897b577bfafb15a36f9e433"
pkgver=2.0.3
pkgrel=1
pkgdesc="Automatically crops the margins of PDF files"
url="https://pypi.org/project/pdfCropMargins/"
arch=('any')
license=('GPL')
makedepends=('python-pip')
depends=('python-setuptools' 'python-wheel' 'python-pysimplegui' 'python-pymupdf' 'python-pypdf2')
optdepends=('ghostscript' 'poppler')
install=${pkgname}.install
source=("https://files.pythonhosted.org/packages/$CodeChemin/$PkgName-$pkgver-py2.py3-none-any.whl")
md5sums=('d7ad34cc2f4f83cbe8c158ccf9133382')

package() {
  cd ${srcdir}
  pip install --root="$pkgdir" $PkgName-$pkgver-py2.py3-none-any.whl
}
