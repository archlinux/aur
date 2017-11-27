# Contributor: Alexej Grigorjew <alexg91@gmx.de>
# Maintainer: Alexej Grigorjew <alexg91@gmx.de>

pkgname=python2-pptx
pkgver=0.6.7
pkgrel=1
pkgdesc="Python library for creating and updating PowerPoint (.pptx) files"
arch=('any')
url="https://pypi.python.org/pypi/python-pptx"
license=('MIT')
depends=('python2' 'python2-pillow' 'python2-lxml' 'python2-xlsxwriter')
makedepends=('python2-setuptools')
source=(https://pypi.python.org/packages/ee/dc/efe3de2b80c944ef22db07940fcbde124663b763d41b3cc2f3c9e9c8ae93/python-pptx-$pkgver.tar.gz)

package() {
  cd "$srcdir/python-pptx-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('c24f15a73a497f9efac6d06099138bfbfdd26ffbe1f36d43f3a2086e23695821')
