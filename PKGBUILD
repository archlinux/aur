# Contributor: Francois Boulogne <devel at sciunto dot org>
# Maintainer: Francois Boulogne <devel at sciunto dot org>

pkgname=python-pdfknife
pkgver=0.2.5
pkgrel=1
pkgdesc="Command line tools to manipulate PDF files"
arch=('any')
url="https://github.com/sciunto-org/PDFknife"
license=('BSD')
depends=('python' 'pdftk' 'poppler' 'ghostscript' 'python-pypdf')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=(https://files.pythonhosted.org/packages/3e/5a/b39c36574f46feeaba2b89faebe9c42ef89c23b867957aac2ea846c5e5ae/pdfknife-${pkgver}.tar.gz)
sha256sums=('def6f02ad3d3417a0246f3fee0619051905f3ed95a0ecabd2ba77297c81df2bd')


package() {
  cd "$srcdir/pdfknife-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
