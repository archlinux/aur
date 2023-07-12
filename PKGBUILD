# Contributor: Francois Boulogne <devel at sciunto dot org>
# Maintainer: Francois Boulogne <devel at sciunto dot org>

pkgname=python-pdfknife
pkgver=0.2.3
pkgrel=1
pkgdesc="Command line tools to manipulate PDF files"
arch=('any')
url="https://github.com/sciunto-org/PDFknife"
license=('GPL3')
depends=('python' 'pdftk' 'poppler' 'ghostscript')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=(https://files.pythonhosted.org/packages/e7/bf/656c7ac048e02ecaa66e7e2cdfaf1e62b223318735769836e98bbbb6b131/PDFknife-${pkgver}.tar.gz)
sha256sums=('d420b115b9ceb01c73f1783f176de9bde86d7114831a2338e46053bfa4087294')


package() {
  cd "$srcdir/PDFknife-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
