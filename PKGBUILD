# Contributor: Francois Boulogne <devel at sciunto dot org>
# Maintainer: Francois Boulogne <devel at sciunto dot org>

pkgname=python-pdfknife
pkgver=0.2.4
pkgrel=5
pkgdesc="Command line tools to manipulate PDF files"
arch=('any')
url="https://github.com/sciunto-org/PDFknife"
license=('BSD')
depends=('python' 'pdftk' 'poppler' 'ghostscript' 'python-pypdf2')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=(https://files.pythonhosted.org/packages/ee/e9/9036196f374f0d6e049a870d740e6c6e04fcaf00f702661445dfe04b71d4/pdfknife-${pkgver}.tar.gz)
sha256sums=('0be2a5857084f2d6bca176b0c13b91777ee519fd3fa29b14995a4fa4bba5c9ac')


package() {
  cd "$srcdir/pdfknife-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
