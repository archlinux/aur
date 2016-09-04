# Contributor: Erhan SAHIN < erhan@ssahin.net >
# Maintainer: Will Price <will.price94@gmail.com>

pkgname=python2-semantic-version
pkgver=2.5.0
pkgrel=1
pkgdesc="Semantic version comparison for Python"
arch=('any')
url="https://github.com/rbarrois/python-semanticversion"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/s/semantic_version/semantic_version-$pkgver.tar.gz")
md5sums=('9a3f8e3ca00dcd2da16e30d55a4d4d99')

package() {
  cd "$srcdir/semantic_version-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
