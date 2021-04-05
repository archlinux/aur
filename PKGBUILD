# Contributor: Alexej Grigorjew <alexg91@gmx.de>
# Maintainer: Alexej Grigorjew <alexg91@gmx.de>

pkgname=python2-pptx
pkgver=0.6.18
pkgrel=1
pkgdesc="Python library for creating and updating PowerPoint (.pptx) files"
arch=('any')
url="https://pypi.python.org/pypi/python-pptx"
license=('MIT')
depends=('python2' 'python2-pillow' 'python2-lxml' 'python2-xlsxwriter')
makedepends=('python2-setuptools')
source=(https://files.pythonhosted.org/packages/bf/86/eb979f7b0333ec769041aae36df8b9f1bd8bea5bbad44620663890dce561/python-pptx-$pkgver.tar.gz)

package() {
  cd "$srcdir/python-pptx-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('a857d69e52d7e8a8fb32fca8182fdd4a3c68c689de8d4e4460e9b4a95efa7bc4')
