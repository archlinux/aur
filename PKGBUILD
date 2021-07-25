# Contributor: Francois Boulogne <devel at sciunto dot org>
# Maintainer: Francois Boulogne <devel at sciunto dot org>

pkgname=python-pdfknife
pkgver=0.2.2
pkgrel=2
pkgdesc="Command line tools to manipulate PDF files"
arch=('any')
url="https://github.com/sciunto-org/PDFknife"
license=('GPL3')
depends=('python' 'pdfjam' 'pdftk' 'poppler' 'ghostscript')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=(https://github.com/sciunto-org/PDFknife/archive/${pkgver}.tar.gz)
sha256sums=('004ede45405b8b59b752e38ca60ae4910b87f8f2898ebf005cdd174a9d555ad1')


package() {
  cd "$srcdir/PDFknife-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
