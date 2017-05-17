# Contributor: Alexej Grigorjew <alexg91 at gmx dot de>
# Maintainer: Alexej Grigorjew <alexg91 at gmx dot de>

pkgname=python2-pptx
pkgver=0.6.5
pkgrel=1
pkgdesc="Python library for creating and updating PowerPoint (.pptx) files"
arch=('any')
url="https://pypi.python.org/pypi/python-pptx"
license=('MIT')
depends=('python2' 'python2-pillow' 'python2-lxml' 'python2-xlsxwriter')
makedepends=('python2-setuptools')
source=(https://pypi.python.org/packages/f8/9c/30bc244cedc571307efe0780d8195ffed5b08f09c94d23f50d6d5144ebc7/python-pptx-$pkgver.tar.gz)

package() {
  cd "$srcdir/python-pptx-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('67926906d088e28f6ad2174f1c6512c4a3507aa9cc2b252cb2fa9698b0588c86')
