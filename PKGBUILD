pkgname=python2-argh
pkgver=0.26.1
pkgrel=1
pkgdesc="An unobtrusive argparse wrapper with natural syntax"
arch=(any)
url="https://pypi.python.org/pypi/argh"
license=('LGPL3')
depends=('python2')
makedepends=('python2-setuptools')
source=(https://pypi.python.org/packages/source/a/argh/argh-$pkgver.tar.gz)
sha256sums=('06a7442cb9130fb8806fe336000fcf20edf1f2f8ad205e7b62cec118505510db')

package() {
  cd "$srcdir/argh-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

