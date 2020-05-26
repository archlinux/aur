# Contributor: Francois Boulogne <devel at sciunto dot org>
# Maintainer: Francois Boulogne <devel at sciunto dot org>

pkgname=python-pdfknife
pkgver=0.2.1
pkgrel=1
pkgdesc="Command line tools to manipulate PDF files"
arch=('any')
url="https://github.com/sciunto-org/PDFknife"
license=('GPL3')
depends=('python' 'pdfjam' 'pdftk' 'poppler' 'ghostscript')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=(https://github.com/sciunto-org/PDFknife/archive/${pkgver}.tar.gz)
sha256sums=('ae1092e7d807e0633339b70d568a37ae17c3d40f322e45d421e4eb94c93ab1d1')


package() {
  cd "$srcdir/PDFknife-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
