# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname=python2-semantic-version
pkgver=2.4.1
pkgrel=1
pkgdesc="Semantic version comparison for Python"
arch=('any')
url="https://github.com/rbarrois/python-semanticversion"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/s/semantic_version/semantic_version-$pkgver.tar.gz")
sha256sums=('33018ab2807ba395c418b4633993a7572b8a4b3e924823f5828788023b3c9b30')

package() {
  cd "$srcdir/semantic_version-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
