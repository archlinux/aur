# Maintainer Robert Booster > boosterdev@linuxmail.org

pkgname=python2-opengraph
pkgver=0.5
pkgrel=1
pkgdesc="A module to parse the Open Graph Protocol"
arch=('x86_64')
url="http://ogp.me/"
license=('MIT')
depends=('python2')
makedepends=('python2-distribute')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/o/opengraph/opengraph-${pkgver}.tar.gz")
sha256sums=('5739e3d67eb93d0002dd64aefd850e49ddd96ddaee39a77dc39aeb869fd5969d')

build() {
  cd "$srcdir"/opengraph-$pkgver
  python2 setup.py build
}

package() {
  cd "$srcdir"/opengraph-$pkgver
  python2 setup.py install --root="$pkgdir"/ --optimize=1
}
