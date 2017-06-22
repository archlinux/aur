# Contributor: Alexej Grigorjew <alexg91@gmx.de>
# Maintainer: Alexej Grigorjew <alexg91@gmx.de>

pkgname=python2-pptx
pkgver=0.6.6
pkgrel=1
pkgdesc="Python library for creating and updating PowerPoint (.pptx) files"
arch=('any')
url="https://pypi.python.org/pypi/python-pptx"
license=('MIT')
depends=('python2' 'python2-pillow' 'python2-lxml' 'python2-xlsxwriter')
makedepends=('python2-setuptools')
source=(https://pypi.python.org/packages/eb/8f/24cf444517959ebd46bda3eea176c5832f9dacec1556e7b5d8d61ee1a8a8/python-pptx-$pkgver.tar.gz)

package() {
  cd "$srcdir/python-pptx-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('b7508d6ab2954854b6efeb2ffc2653ff0e8185fb314df6c8673c534b0caeed50')
